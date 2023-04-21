import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/review/save_page/widgets/review_save_form.dart';
import 'package:village/view/widgets/rating_star.dart';

class ReviewSaveBody extends StatelessWidget {
  const ReviewSaveBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '리뷰작성',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              ReviewSaveForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
