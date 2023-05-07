import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/place/place_List.dart';
import 'package:village/model/search/search.dart';
import 'package:village/model/search/search_repository.dart';

final searchPageProvider =
    StateNotifierProvider.autoDispose<SearchPageViewModel, SearchPageModel?>(
        (ref) {
  return SearchPageViewModel(null);
});

class SearchPageModel {
  List<Search> searches;
  List<Places> searchList;

  SearchPageModel({
    required this.searches,
    required this.searchList,
  });
}

class SearchPageViewModel extends StateNotifier<SearchPageModel?> {
  SearchPageViewModel(super.state);

  final storage = const FlutterSecureStorage();

  void notifyInit(String keyword) async {
    ResponseDTO responseDTO = await SearchRepository().fetchSearchList(keyword);
    List<Search>? searches = state!.searches;
    state = SearchPageModel(searchList: responseDTO.data, searches: searches);
  }

  // 검색 추가
  Future<void> addSearch(Search search) async {
    final newSearches = [search, ...state!.searches];
    List<Places>? searchList = state!.searchList;
    state = SearchPageModel(searches: newSearches, searchList: searchList);
    await saveToStorage();
  }

  // 검색 삭제
  Future<void> removeSearch(int id) async {
    final newSearches = state!.searches.where((e) => e.id != id).toList();
    List<Places>? searchList = state!.searchList;
    state = SearchPageModel(searches: newSearches, searchList: searchList);
    await saveToStorage();
  }

  Future<void> readFromStorage() async {
    try {
      final data = await storage.read(key: 'searches');
      if (data != null) {
        final searchList = (json.decode(data) as List<dynamic>)
            .map<Search>((search) => Search.fromJson(search))
            .toList();
        List<Places>? searchList1 = state!.searchList;
        state = SearchPageModel(searches: searchList, searchList: searchList1);
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> saveToStorage() async {
    try {
      final encodedSearches = json
          .encode(state!.searches.map((search) => search.toJson()).toList());
      await storage.write(key: 'searches', value: encodedSearches);
    } catch (e) {
      // Handle error
    }
  }

  List<String> getSearchKeywords() {
    return state?.searches.map((search) => search.keyword).toList() ?? [];
  }
}
