

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/reservation/reservation.dart';
import 'package:village/model/reservation/reservation_repository.dart';
import 'package:village/provider/session_provider.dart';

// 창고 관리자
// 순서 : 창고, 창고데이터?(? : null일 수도 있음)
// autoDispose : pop될 때 데이터창고를 날려버림
final UserReservationPageProvider = StateNotifierProvider.autoDispose<UserReservationPageViewModel, UserReservationPageModel?>((ref) {
  SessionUser sessionUser = ref.read(sessionProvider);
  return UserReservationPageViewModel(null)..notifyInit(sessionUser.jwt!);
});


// 창고 데이터 :
class UserReservationPageModel {
  List<Reservation> reservations;
  //생성자 필요
  UserReservationPageModel({required this.reservations});

}

// 창고
class UserReservationPageViewModel extends StateNotifier<UserReservationPageModel?>{
  UserReservationPageViewModel(super.state);

  // 창고 초기화 : 통신 2번
  // view한테 알려줌
  void notifyInit(String jwt) async{
    ResponseDTO responseDTO = await ReservationRepository().fetchReservationList(jwt);
    state = UserReservationPageModel(reservations: responseDTO.data);
  }

  // 추가 : collection일 때 가능
  void notifyAdd(Reservation reservation){
    List<Reservation> reservations = state!.reservations; // 기존 posts는 state가 가지고 있음
    List<Reservation> newReservations = [reservation ,...reservations ];
    state = UserReservationPageModel(reservations: newReservations);
  }

  // 삭제
  void notifyRemove(int id){
    List<Reservation> reservations = state!.reservations; // 기존 posts는 state가 가지고 있음
    List<Reservation> newReservations = reservations.where((e) => e.id != id).toList();
    state = UserReservationPageModel(reservations: newReservations);

  }

  // 수정
  void notifyUpdate(Reservation reservation){
    List<Reservation> reservations = state!.reservations; // 기존 posts는 state가 가지고 있음
    List<Reservation> newReservations = reservations.map((e) => e.id == reservation.id ? reservation : e).toList();
    state = UserReservationPageModel(reservations: newReservations);
  }


}