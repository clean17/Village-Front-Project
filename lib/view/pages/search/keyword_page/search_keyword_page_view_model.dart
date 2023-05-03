import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:village/model/search/search.dart';

final searchKeywordPageProvider =
StateNotifierProvider.autoDispose<SearchKeywordPageViewModel,
    SearchKeywordPageModel?>((ref) {
  return SearchKeywordPageViewModel(null);
});


class SearchKeywordPageModel {
  List<Search> searches;

  SearchKeywordPageModel({required this.searches});
}

class SearchKeywordPageViewModel
    extends StateNotifier<SearchKeywordPageModel?> {
  SearchKeywordPageViewModel(SearchKeywordPageModel? state)
      : super(state ?? SearchKeywordPageModel(searches: []));

  final storage = FlutterSecureStorage();

  // 검색 추가
  Future<void> addSearch(Search search) async {
    final newSearches = [search,...state!.searches];
    state = SearchKeywordPageModel(searches: newSearches);
    await saveToStorage();
  }

  // 검색 삭제
  Future<void> removeSearch(int id) async {
    final newSearches = state!.searches.where((e) => e.id != id).toList();
    state = SearchKeywordPageModel(searches: newSearches);
    await saveToStorage();
  }


  Future<void> readFromStorage() async {
    try {
      final data = await storage.read(key: 'searches');
      if (data != null) {
        final searchList = (json.decode(data) as List<dynamic>)
            .map<Search>((search) => Search.fromJson(search))
            .toList();
        state = SearchKeywordPageModel(searches: searchList);
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> saveToStorage() async {
    try {
      final encodedSearches =
      json.encode(state!.searches.map((search) => search.toJson()).toList());
      await storage.write(key: 'searches', value: encodedSearches);
    } catch (e) {
      // Handle error
    }
  }

  List<String> getSearchKeywords() {
    return state?.searches.map((search) => search.keyword).toList() ?? [];
  }
}
