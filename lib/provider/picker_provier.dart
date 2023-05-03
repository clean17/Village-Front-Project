import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 창고 관리자
final pickerProvider =
    StateNotifierProvider.autoDispose<PickerViewModel, PickerModel?>((ref) {
  return PickerViewModel(null);
});

// 창고 데이터
class PickerModel {
  DateTime? startTime;
  DateTime? endTime;
  int? maxPeople;
  int? maxParking;
  DateTime? reservationDate;

  PickerModel({
    this.startTime,
    this.endTime,
    this.maxParking,
    this.maxPeople,
    this.reservationDate,
  });
}

// 창고
class PickerViewModel extends StateNotifier<PickerModel?> {
  PickerViewModel(super.state);

  void notifyChangeResevationDate(DateTime? reservationDate) {
    DateTime? endTime = state?.endTime;
    DateTime? startTime = state?.startTime;
    int? maxPeople = state?.maxPeople;
    int? maxParking = state?.maxParking;
    state = PickerModel(
      reservationDate: reservationDate,
      startTime: startTime,
      endTime: endTime,
      maxParking: maxParking,
      maxPeople: maxPeople,
    );
    Logger().d("예약 일 변경");
  }

  void notifyChangeStartTime(DateTime time) {
    DateTime? endTime = state?.endTime;
    DateTime? reservationDate = state?.reservationDate;
    int? maxPeople = state?.maxPeople;
    int? maxParking = state?.maxParking;
    state = PickerModel(
      reservationDate: reservationDate,
      startTime: time,
      endTime: endTime,
      maxParking: maxParking,
      maxPeople: maxPeople,
    );
    Logger().d("예약 시작 시간 변경");
  }

  void notifyChangeEndTime(DateTime time) {
    DateTime? startTime = state?.startTime;
    DateTime? reservationDate = state?.reservationDate;
    int? maxPeople = state?.maxPeople;
    int? maxParking = state?.maxParking;
    state = PickerModel(
      reservationDate: reservationDate,
      endTime: time,
      startTime: startTime,
      maxParking: maxParking,
      maxPeople: maxPeople,
    );
    Logger().d("예약 끝 시간 변경");
  }

  void notifyChangeMaxPeople(int num) {
    DateTime? startTime = state?.startTime;
    DateTime? reservationDate = state?.reservationDate;
    DateTime? endTime = state?.endTime;
    int? maxParking = state?.maxParking;
    state = PickerModel(
      reservationDate: reservationDate,
      endTime: endTime,
      startTime: startTime,
      maxParking: maxParking,
      maxPeople: num,
    );
    Logger().d("예약 인원 변경");
  }

  void notifyChangeMaxParking(int num) {
    DateTime? startTime = state?.startTime;
    DateTime? reservationDate = state?.reservationDate;
    DateTime? endTime = state?.endTime;
    int? maxPeople = state?.maxPeople;
    state = PickerModel(
      reservationDate: reservationDate,
      endTime: endTime,
      startTime: startTime,
      maxParking: num,
      maxPeople: maxPeople,
    );
  }
}
