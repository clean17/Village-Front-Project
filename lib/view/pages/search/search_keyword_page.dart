import 'package:flutter/material.dart';
import 'package:village/view/widgets/search/my_search_keyword.dart';
import 'package:village/view/widgets/search/search_keyword.dart';

class SearchKeywordPage extends StatelessWidget {
  const SearchKeywordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 1),
              width: mWidth * 0.8,
              height: 42,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(24)),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: '지역, 공간, 카테고리로 찾아보세요.',
                  border: InputBorder.none,
                ),
              ),
            ),
            const Spacer(),
            const Text(
              '취소',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '인기키워드',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: const [
                  SearchKeyword(text: '인기있는 키워드'),
                  SearchKeyword(text: '독서실'),
                  SearchKeyword(text: '사무실'),
                  SearchKeyword(text: '연습실'),
                  SearchKeyword(text: '근처 핫한 장소'),
                ],
              ),
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
              Wrap(
                children: const [
                  MySearchKeyword(text: '인기있는 키워드'),
                  MySearchKeyword(text: '독서실'),
                  MySearchKeyword(text: '사무실'),
                  MySearchKeyword(text: '연습실'),
                  MySearchKeyword(text: '근처 핫한 장소'),
                  MySearchKeyword(text: '인기있는 키워드'),
                  MySearchKeyword(text: '독서실'),
                  MySearchKeyword(text: '사무실'),
                  MySearchKeyword(text: '연습실'),
                  MySearchKeyword(text: '근처 핫한 장소'),
                  MySearchKeyword(text: '인기있는 키워드'),
                  MySearchKeyword(text: '독서실'),
                  MySearchKeyword(text: '사무실'),
                  MySearchKeyword(text: '연습실'),
                  MySearchKeyword(text: '근처 핫한 장소'),
                  MySearchKeyword(text: '인기있는 키워드'),
                  MySearchKeyword(text: '독서실'),
                  MySearchKeyword(text: '사무실'),
                  MySearchKeyword(text: '연습실'),
                  MySearchKeyword(text: '근처 핫한 장소'),
                  MySearchKeyword(text: '인기있는 키워드'),
                  MySearchKeyword(text: '독서실'),
                  MySearchKeyword(text: '사무실'),
                  MySearchKeyword(text: '연습실'),
                  MySearchKeyword(text: '근처 핫한 장소'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
