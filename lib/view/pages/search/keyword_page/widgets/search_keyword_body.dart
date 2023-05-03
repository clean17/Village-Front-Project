import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/model/search/search.dart';
import 'package:village/view/pages/search/keyword_page/search_keyword_page_view_model.dart';
import 'package:village/view/pages/search/keyword_page/widgets/user_search_keyword.dart';
import 'package:village/view/pages/search/keyword_page/widgets/hot_search_keyword.dart';

class SearchKeywordBody extends ConsumerWidget {
  SearchKeywordBody({Key? key}) : super(key: key);

  List<String> hotKeys = ['독서실', '사무실', '연습실', '근처 핫한 장소'];


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    void _removeSearch(int id) async {
      await ref.read(searchKeywordPageProvider.notifier).removeSearch(id);
    }

    SearchKeywordPageModel? model = ref.watch(searchKeywordPageProvider);
    List<Search> searches = [];
    if (model != null) {
      searches = model.searches;
    }

    List<HotSearchKeyword> hotkeywords = List.generate(
        hotKeys.length,
            (index) => HotSearchKeyword(
          text: hotKeys[index],
        ));

    List<UserSearchKeyword> userKeywords = [];
    if (model != null) {
      userKeywords = List.generate(
        model.searches.length,
            (index) => UserSearchKeyword(
          onDelete: () {
            _removeSearch(model.searches[index].id);
          },
          text: model.searches[index].keyword,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            '인기 키워드',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          // 검색 리스트 받아오기
          Wrap(children: hotkeywords),
          const SizedBox(
            height: 40,
          ),
          const Text(
            '검색 기록',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(children: userKeywords)
        ],
      ),
    );
  }
}
