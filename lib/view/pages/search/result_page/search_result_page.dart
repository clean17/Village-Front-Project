import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/main/main_page/main_page.dart';
import 'package:village/view/pages/search/keyword_page/search_keyword_page_view_model.dart';
import 'package:village/view/pages/search/keyword_page/widgets/search_keyword_bar.dart';
import 'package:village/view/pages/search/result_page/search_result_page_view_model.dart';
import 'package:village/view/pages/search/result_page/widgets/search_result_back_icon.dart';
import 'package:village/view/pages/search/result_page/widgets/search_result_body.dart';

class SearchResultPage extends ConsumerWidget {
  String keyword;

  SearchResultPage({super.key, this.keyword = ''});

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kpm = ref.watch(searchKeywordPageProvider);
    final pm = ref.watch(searchResultPageProvider);
    return WillPopScope(
        onWillPop: () async {
          // 이 코드를 사용하여 MyHomePage로 이동합니다.
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
            (route) => false, // 모든 이전 라우트를 스택에서 제거합니다.
          );
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: SearchResultBackIcon(context),
            title: SearchKeywordBar(
                searchController: _searchController,
                text: kpm?.searches.first.keyword),
            systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
              statusBarIconBrightness: Brightness.light, // 최상단
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: SearchResultBody(pm: pm),
        ));
  }
}
