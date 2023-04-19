import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/main/home_page/widgets/categories.dart';
import 'package:village/view/pages/main/home_page/widgets/home_body.dart';
import 'package:village/view/pages/main/home_page/widgets/place_container.dart';
import 'package:village/view/pages/main/home_page/widgets/recommend_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}
