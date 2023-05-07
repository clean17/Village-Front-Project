import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/main.dart';
import 'package:village/model/search/search.dart';
import 'package:village/view/pages/search/result_page/search_result_page.dart';
import 'package:village/view/pages/search/search_page_view_model.dart';

final searchControllerProvider = Provider<SearchController>((ref) {
  return SearchController(ref);
});

class SearchController {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  SearchController(this.ref);

  Future<void> searchKeyword(String keyword) async {
    Navigator.push(
      mContext!,
      MaterialPageRoute(
          builder: (context) => SearchResultPage(
                keyword: keyword,
              )),
    );
    ref.read(searchPageProvider.notifier).addSearch(Search(keyword: keyword));
  }
}
