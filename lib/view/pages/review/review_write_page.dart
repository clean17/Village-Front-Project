import 'package:flutter/material.dart';
import 'package:village/core/style.dart';
import 'package:village/view/widgets/rating_star.dart';
import 'package:village/view/widgets/simple_appbar.dart';

class ReviewWritePage extends StatelessWidget {
  const ReviewWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: simpleAppbar(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '리뷰작성',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
