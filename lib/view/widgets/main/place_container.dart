import 'package:flutter/material.dart';

class PlaceContainer extends StatelessWidget {
  const PlaceContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.hardEdge,
        height: 280,
        width: 340,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                  width: double.infinity,
                  child: Image.network(
                    "https://picsum.photos/id/2/200/200",
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("울산 북구"),
                          SizedBox(width: 100,),
                          Text("10명"),
                          Text("14대"),
                        ],
                      ),
                      Text("숨 뮤직 스튜디오_홀"),
                      Text("#울산음악연습실 #울산연기연습실 #울산개인연습실"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text("0.0 (0)"),
                          Text("16,000원")
                        ],),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
