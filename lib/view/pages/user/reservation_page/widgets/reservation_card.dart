import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';

class ReservationCard extends StatelessWidget {
  // final data;
  // final title;
  // final start_time;
  // final end_time;
  // final status;

  const ReservationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
            // margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("날짜", style: mgrey_text),
                    SizedBox(width: 20),
                    Text(
                      "2023.04.17",
                      style: mblack_text,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("시간", style: mgrey_text),
                    SizedBox(width: 20),
                    Text(
                      "14:00 - 18:00",
                      style: mblack_text,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("장소", style: mgrey_text),
                    SizedBox(width: 20),
                    Text(
                      "숨 뮤직 스튜디오",
                      style: mblack_text,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("가격", style: mgrey_text),
                    SizedBox(width: 20),
                    Text("25,000원", style: mblack_text),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        print("취소버튼");
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "취소",
                          style: mwhite_text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ));
      },
    );
  }
}
