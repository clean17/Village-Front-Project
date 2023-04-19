import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  const RecommendCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                     SizedBox(
      height: 200,
      width: 340,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 15),
            height: 200,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/a1.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  left: 5,
                  child: Text(
                    "커버댄스 촬영하기 \n좋은 스튜디오",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
