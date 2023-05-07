import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/controller/search_controller.dart';
import 'package:village/view/pages/search/keyword_page/widgets/search_keyword_bar.dart';
import 'package:village/view/pages/search/result_page/search_result_page_view_model.dart';
import 'package:village/view/pages/search/result_page/widgets/search_result_body.dart';
import 'package:village/view/widgets/custom_back_icon.dart';

class SearchResultPage extends ConsumerWidget {
  String keyword;

  SearchResultPage({super.key, this.keyword = ''});

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cp = ref.read(searchControllerProvider);
    ref.read(searchResultPageProvider.notifier).notifyInit(keyword);
    final pm = ref.watch(searchResultPageProvider);
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackIcon(context),
        actions: [
          SearchKeywordBar(
              cp: cp, searchController: _searchController, text: keyword),
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
      body: SearchResultBody(pm: pm),
    );
  }
}
