import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/model/reservation/reservation.dart';
import 'package:village/view/pages/user/reservation_page/widgets/user_reservation_card_button.dart';

class UserReservationListItem extends StatelessWidget {
  final Reservation reservation;

  const UserReservationListItem(this.reservation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(reservation.date);
    String formattedStartTime =
        DateFormat('HH:mm').format(reservation.startTime);
    String formattedEndTime = DateFormat('HH:mm').format(reservation.endTime);

    return Column(
      children: [
        Row(
          children: [
            Text("날짜", style: mgrey_text),
            SizedBox(width: 20),
            Text(
              formattedDate,
              style: mblack_text,
            ),
          ],
        ),
        Row(
          children: [
            Text("시간", style: mgrey_text),
            SizedBox(width: 20),
            Text(
              "$formattedStartTime - $formattedEndTime",
              style: mblack_text,
            ),
          ],
        ),
        Row(
          children: [
            Text("장소", style: mgrey_text),
            SizedBox(width: 20),
            Text(
              "${reservation.place.title}",
              style: mblack_text,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("주소", style: mgrey_text),
            SizedBox(width: 20),
            Text("${reservation.place.address.sigungu}", style: mblack_text),
            Spacer(),
            if (reservation.status == "WAIT") UserReservationCardButton(title: "취소", press: (){}, color: Colors.redAccent),
            if (reservation.status == "FAIL") UserReservationCardButton(title: "예약실패", press: (){}, color: Colors.black54),
            if (reservation.status == "COMPLETE") UserReservationCardButton(title: "예약완료", press: (){}, color: Colors.blue),
          ],
        ),
      ],
    );
  }
}
