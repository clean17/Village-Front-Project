import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/model/place/place_List.dart';

// 창고 관리자
// 순서 : 창고, 창고데이터?(? : null일 수도 있음)
// autoDispose : pop될 때 데이터창고를 날려버림
final searchResultPageProvider = StateNotifierProvider.autoDispose<
    SearchResultPageViewModel, SearchResultPageModel?>((ref) {
  return SearchResultPageViewModel(null);
});

// 창고 데이터 :
class SearchResultPageModel {
  List<Places>? searchList;
  String? keyword;
  //생성자 필요
  SearchResultPageModel({
    this.searchList,
    this.keyword,
  });
}

// 창고
class SearchResultPageViewModel extends StateNotifier<SearchResultPageModel?> {
  SearchResultPageViewModel(super.state);

  void notifyAdd(List<Places> response) async {
    String? keyword = state?.keyword;
    state = SearchResultPageModel(searchList: response, keyword: keyword);
  }

  void notifyKeyword(String keyword) async {
    List<Places>? searchList = state?.searchList;
    state = SearchResultPageModel(searchList: searchList, keyword: keyword);
    Logger().d(state?.keyword);
  }
}
