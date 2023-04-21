import 'package:flutter/material.dart%20';
import 'package:village/view/pages/place/category_page/widgets/place_category_appbar.dart';
import 'package:village/view/pages/place/category_page/widgets/place_category_body.dart';

class PlaceCategoryPage extends StatelessWidget {
  const PlaceCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlaceCatetoryApp(),
      body: const PlaceCategoryBody(),
    );
  }
}
