import 'package:flutter/material.dart';
import 'package:village/view/pages/search/keyword_page/widgets/search_keyword_bar.dart';
import 'package:village/view/pages/search/keyword_page/widgets/search_keyword_body.dart';

class SearchKeywordPage extends StatefulWidget {
  const SearchKeywordPage({super.key});

  @override
  State<SearchKeywordPage> createState() => _SearchKeywordPageState();
}

class _SearchKeywordPageState extends State<SearchKeywordPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SearchKeywordBar(
                searchController: _searchController,
                text: '지역, 공간 카테고리로 찾아보세요'),
            const Spacer(),
            TextButton(
                onPressed: () {
                  _searchController.clear();
                },
                child: const Text(
                  '취소',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ))
          ],
        ),
      ),
      body: SearchKeywordBody(),
    );
  }
}
