import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/model/search/search.dart';
import 'package:village/view/pages/search/keyword_page/search_keyword_page_view_model.dart';
import 'package:village/view/pages/search/result_page/search_result_page.dart';

class SearchKeywordBar extends ConsumerWidget{
  const SearchKeywordBar( {
    required this.text,
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;
  final text;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 1, left: 5),
      width: getScreenWidth(context) * 0.74,
      height: 42,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(24)),
      child: TextField(
        controller: _searchController,
        onSubmitted: (String keyword) async{
          if (keyword.isNotEmpty) {
            final viewModel = ref.read(searchKeywordPageProvider.notifier);
            await viewModel.addSearch(Search(keyword: keyword));
            Logger().d(keyword);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchResultPage(keyword: keyword)),
            );
          }
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: text,
          border: InputBorder.none,
        ),
      ),
    );
  }

}