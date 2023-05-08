// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/model/reservation/reservation.dart';

final placeReservationProvider = StateNotifierProvider.autoDispose<
    PlaceDetailReservationViewModel, PlaceDetailReservationModel?>((ref) {
  return PlaceDetailReservationViewModel(PlaceDetailReservationModel());
});

// 창고 데이터
class PlaceDetailReservationModel {
  Reservation? reservation;
  PlaceDetailReservationModel({
    this.reservation,
  });
}

// 창고
class PlaceDetailReservationViewModel
    extends StateNotifier<PlaceDetailReservationModel?> {
  PlaceDetailReservationViewModel(super.state);

  void notifyAdd(Reservation reservation) async {
    state = PlaceDetailReservationModel(reservation: reservation);
    Logger().d("예약 데이터 입력");
  }
}
