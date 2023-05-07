import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/model/search/search.dart';
import 'package:village/view/pages/search/keyword_page/search_keyword_page_view_model.dart';
import 'package:village/view/pages/search/keyword_page/widgets/user_search_keyword.dart';
import 'package:village/view/pages/search/keyword_page/widgets/hot_search_keyword.dart';

class SearchKeywordBody extends ConsumerStatefulWidget {
  const SearchKeywordBody({Key? key}) : super(key: key);

  @override
  _SearchKeywordBodyState createState() => _SearchKeywordBodyState();
}

class _SearchKeywordBodyState extends ConsumerState<SearchKeywordBody> {
  List<String> hotKeys = ['독서실', '사무실', '연습실', '근처 핫한 장소'];

  @override
  // 재실행했을 경우
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(searchKeywordPageProvider.notifier)
          .readFromStorage()
          .then((_) => setState(() {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    void _removeSearch(int id) async {
      await ref.read(searchKeywordPageProvider.notifier).removeSearch(id);
    }

    final model = ref.watch(searchKeywordPageProvider);
    final searches = model?.searches ?? [];

    final hotkeywords = List.generate(
      hotKeys.length,
      (index) => HotSearchKeyword(
        text: hotKeys[index],
      ),
    );

    final userKeywords = List.generate(
      searches.length,
      (index) => UserSearchKeyword(
        onDelete: () {
          _removeSearch(searches[index].id);
        },
        text: searches[index].keyword,
      ),
    );

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
          Wrap(children: userKeywords),
        ],
      ),
    );
  }
}
