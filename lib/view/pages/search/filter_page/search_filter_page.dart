import 'package:flutter/material.dart';
import 'package:village/view/pages/search/filter_page/widgets/search_filter_body.dart';
import 'package:village/view/widgets/custom_close_appbar.dart';

class SearchFilterPage extends StatelessWidget {
  const SearchFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomCloseAppbar(text: '필터'),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SearchFilterBody(),
      ),
    );
  }
}
