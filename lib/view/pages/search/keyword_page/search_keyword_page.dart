import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/search/keyword_page/widgets/search_keyword_bar.dart';
import 'package:village/view/pages/search/keyword_page/widgets/search_keyword_body.dart';

class SearchKeywordPage extends ConsumerWidget {
  SearchKeywordPage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: ListView(
        children: const [
          SearchKeywordBody(),
        ],
      ),
    );
  }
}
