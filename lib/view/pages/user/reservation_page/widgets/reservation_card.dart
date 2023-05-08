import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/model/reservation/reservation.dart';
import 'package:village/view/pages/user/reservation_page/user_reservation_page_view_model.dart';
import 'package:village/view/pages/user/reservation_page/widgets/user_reservation_list_item.dart';

class ReservationCard extends ConsumerWidget {

  const ReservationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserReservationPageModel? model =
    ref.watch(UserReservationPageProvider); // model이 null일 수도 있어서 ? 사용
    List<Reservation> reservations = [];
    if (model != null) {
      reservations = model.reservations;
    }
    return ListView(
      children: List.generate(
        reservations.length,
        (index) => Container(
          margin: EdgeInsets.only(left: 20,right: 20, top: 17),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              // border: Border.all(width: ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
          child: UserReservationListItem(reservations[index]),
        ),
      ),
    );
  }
}
