import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';

class HostReservationCard extends StatelessWidget {
  const HostReservationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(5, (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            // border: Border.all(width: ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ) ,
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
                children: [
                  Text("인원", style: mgrey_text),
                  SizedBox(width: 20),
                  Text(
                    "10명",
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
                      print("승인버튼");
                    },
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "승인",
                          style: mwhite_text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      print("승인거절버튼");
                    },
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "거절",
                          style: mwhite_text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ))),

    );
  }
}
