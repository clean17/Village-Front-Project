import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/review/save_page/widgets/review_save_body.dart';
import 'package:village/view/widgets/rating_star.dart';
import 'package:village/view/widgets/simple_appbar.dart';

class ReviewSavePage extends StatelessWidget {
  const ReviewSavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: simpleAppbar(),
      body: const ReviewSaveBody(),
    );
  }
}
