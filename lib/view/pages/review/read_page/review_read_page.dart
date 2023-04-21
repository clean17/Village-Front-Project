import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/review/read_page/widgets/riview_read_body.dart';
import 'package:village/view/pages/review/read_page/widgets/thumbs_down.dart';
import 'package:village/view/pages/review/read_page/widgets/thumbs_up.dart';
import 'package:village/view/widgets/rating_star.dart';
import 'package:village/view/widgets/simple_appbar.dart';

class ReviewReadPage extends StatelessWidget {
  const ReviewReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: simpleAppbar(),
      body: const ReviewReadBody(),
    );
  }
}
