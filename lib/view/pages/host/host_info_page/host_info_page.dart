import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/host/host_info_page/widgets/host_header.dart';
import 'package:village/view/pages/host/host_info_page/widgets/host_reservation_card.dart';
import 'package:village/view/widgets/main_appbar.dart';

class HostInfoPage extends StatelessWidget {
  const HostInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: MainAppbar(),
        body: Column(
          children: [
            HostHeader(),
            Container(
              child: TabBar(
                indicatorColor: kPrimaryColor,
                labelColor: kPrimaryColor,
                labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  Tab(
                    text: "신청현황",
                  ),
                  Tab(
                    text: "예약현황",
                  ),
                  Tab(
                    text: "채팅내역",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HostReservationCard(),
                  HostReservationCard(),
                  Center(
                    child: Text("채팅 내역"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
