import 'package:flutter/material.dart%20';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/place/category_page/widgets/place_category_appbar.dart';
import 'package:village/view/pages/place/category_page/widgets/place_category_body.dart';
import 'package:village/view/pages/search/result_page/search_result_page_view_model.dart';

class PlaceCategoryPage extends ConsumerWidget {
  const PlaceCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pm = ref.watch(searchResultPageProvider);
    // 프로바이더에서 데이터를 넣었는데 왜 안보여 ? 넣기전 데이터를 보고 있는거야 ?
    return Scaffold(
      appBar: PlaceCatetoryApp(),
      body: PlaceCategoryBody(
        pm: pm,
      ),
    );
  }
}
