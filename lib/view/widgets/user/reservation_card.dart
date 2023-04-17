import 'package:flutter/material.dart';
import 'package:village/core/style.dart';

class ReservationCard extends StatelessWidget {
  const ReservationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                )),
            height: 135,
            child: Column(
              children: [
                Row(
                  children: [
                    Text("날짜", style: mgrey_text),
                    SizedBox(width: 20),
                    Text("2023.04.17", style: mblack_text,),
                  ],
                ),
                Row(
                  children: [
                    Text("시간", style: mgrey_text),
                    SizedBox(width: 20),
                    Text("14:00 - 18:00", style: mblack_text,),
                  ],
                ),
                Row(
                  children: [
                    Text("장소", style: mgrey_text),
                    SizedBox(width: 20),
                    Text("숨 뮤직 스튜디오", style: mblack_text,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("가격", style: mgrey_text),
                    SizedBox(width: 20),
                    Text("25,000원",style: mblack_text),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        print("취소버튼");
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text("취소", style: mwhite_text, textAlign: TextAlign.center,),
                      ),
                    )
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
