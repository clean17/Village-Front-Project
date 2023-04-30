import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 관리자
final pickerProvider =
    StateNotifierProvider.autoDispose<PickerViewModel, PickerModel?>((ref) {
  return PickerViewModel(null);
});

// 창고 데이터
class PickerModel {
  DateTime? startTime;
  DateTime? endTime;
  String? maxPeople;
  String? maxParking;

  PickerModel({
    this.startTime,
    this.endTime,
    this.maxParking,
    this.maxPeople,
  });
}

// 창고
class PickerViewModel extends StateNotifier<PickerModel?> {
  PickerViewModel(super.state);

  void notifyChangeStartTime(DateTime time) {
    DateTime? endTime = state?.endTime;
    String? maxPeople = state?.maxPeople;
    String? maxParking = state?.maxParking;
    state = PickerModel(
      startTime: time,
      endTime: endTime,
      maxParking: maxParking,
      maxPeople: maxPeople,
    );
  }

  void notifyChangeEndTime(DateTime time) {
    DateTime? startTime = state?.startTime;
    String? maxPeople = state?.maxPeople;
    String? maxParking = state?.maxParking;
    state = PickerModel(
      endTime: time,
      startTime: startTime,
      maxParking: maxParking,
      maxPeople: maxPeople,
    );
  }

  void notifyChangeMaxPeople(String num) {
    DateTime? startTime = state?.startTime;
    DateTime? endTime = state?.endTime;
    String? maxParking = state?.maxParking;
    state = PickerModel(
      endTime: endTime,
      startTime: startTime,
      maxParking: maxParking,
      maxPeople: num,
    );
  }

  void notifyChangeMaxParking(String num) {
    DateTime? startTime = state?.startTime;
    DateTime? endTime = state?.endTime;
    String? maxPeople = state?.maxPeople;
    state = PickerModel(
      endTime: endTime,
      startTime: startTime,
      maxParking: num,
      maxPeople: maxPeople,
    );
  }
}
