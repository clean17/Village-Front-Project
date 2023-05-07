import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/main.dart';
import 'package:village/model/search/search.dart';
import 'package:village/model/search/search_repository.dart';
import 'package:village/view/pages/search/keyword_page/search_keyword_page_view_model.dart';
import 'package:village/view/pages/search/result_page/search_result_page_view_model.dart';

final searchControllerProvider = Provider<SearchController>((ref) {
  return SearchController(ref);
});

class SearchController {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  SearchController(this.ref);

  Future<void> searchKeyword(String keyword) async {
    Navigator.pushNamed(mContext!, Move.seartchResultPage);
    ref
        .read(searchKeywordPageProvider.notifier)
        .addSearch(Search(keyword: keyword));
    ResponseDTO responseDTO = await SearchRepository().fetchSearchList(keyword);
    ref.read(searchResultPageProvider.notifier).notifyAdd(responseDTO.data);
  }
}
