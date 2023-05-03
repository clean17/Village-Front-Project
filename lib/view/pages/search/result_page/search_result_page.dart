import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:village/model/search/search.dart';
import 'package:village/view/pages/search/keyword_page/widgets/search_keyword_bar.dart';
import 'package:village/view/pages/search/result_page/widgets/search_result_body.dart';
import 'package:village/view/widgets/custom_back_icon.dart';

class SearchResultPage extends StatefulWidget {

  final String keyword;

  const SearchResultPage({super.key, required this.keyword});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackIcon(context),
        actions: [
          SearchKeywordBar(searchController: _searchController, text: widget.keyword),
          const SizedBox(
            width: 20,
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarIconBrightness: Brightness.light, // 최상단
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: const SearchResultBody(),
    );
  }
}
