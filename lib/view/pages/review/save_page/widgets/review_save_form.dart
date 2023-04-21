import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/widgets/rating_star.dart';

class ReviewSaveForm extends StatelessWidget {
  const ReviewSaveForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RatingStar(),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey[200],
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  '사진추가',
                  style: mblack_text,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '리뷰를 입력하세요',
            ),
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
