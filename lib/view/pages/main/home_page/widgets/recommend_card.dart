import 'package:flutter/material.dart';
import 'package:village/dummy/exhibition_list.dart';

class RecommendCard extends StatelessWidget {
  const RecommendCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          String imagePath = exhibitionList[index];
          return Container(
            margin: EdgeInsets.only(left: 15),
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
