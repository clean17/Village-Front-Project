import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/review/read_page/widgets/host_reply.dart';
import 'package:village/view/pages/review/read_page/widgets/thumbs_down.dart';
import 'package:village/view/pages/review/read_page/widgets/thumbs_up.dart';
import 'package:village/view/pages/review/read_page/widgets/user_review.dart';
import 'package:village/view/widgets/rating_star.dart';

class ReviewReadBody extends StatelessWidget {
  const ReviewReadBody({
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
                  '리뷰',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              UserReview(),
              SizedBox(
                height: 20,
              ),
              HostReply()
            ],
          ),
        )
      ],
    );
  }
}
