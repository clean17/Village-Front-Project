import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/view/pages/user/widgets/reservation_card.dart';


class MyReservationPage extends StatelessWidget {
  const MyReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "예약 내역",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: kPrimaryColor,
            labelColor: kPrimaryColor,
            labelStyle: TextStyle(fontSize: 15),
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                text: "신청",
              ),
              Tab(
                text: "예약",
              ),
              Tab(
                text: "지난 예약",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ReservationCard(),
            ReservationCard(),
            ReservationCard(), // 버튼이 리뷰쓰기로 바뀌게 하기
          ],
        ),
      ),
    );
  }

}
