import 'package:flutter/material.dart';
import 'package:village/view/pages/search/keyword_page/widgets/user_search_keyword.dart';
import 'package:village/view/pages/search/keyword_page/widgets/hot_search_keyword.dart';

class SearchKeywordBody extends StatelessWidget {
  SearchKeywordBody({
    super.key,
  });

  List<String> hotKeys = ['독서실', '사무실', '연습실', '근처 핫한 장소'];
  List<String> userKeys = ['독서실1', '사무실2', '연습실3', '근처 핫한 장소4'];

  // final _inputHistory = ['인기있는 키워드1', '공유 오피스1'];

  // void _removeKeyword(String keyword) {
  //   setState(() {
  //     _inputHistory.remove(keyword);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<HotSearchKeyword> hotkeywords = List.generate(
        hotKeys.length,
        (index) => HotSearchKeyword(
              text: hotKeys[index],
            ));

    List<UserSearchKeyword> userKeywords = List.generate(
        userKeys.length,
        (index) => UserSearchKeyword(
              onDelete: () {},
              text: userKeys[index],
            ));

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
