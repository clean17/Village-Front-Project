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

  PickerModel({
    this.startTime,
    this.endTime,
  });
}

// 창고
class PickerViewModel extends StateNotifier<PickerModel?> {
  PickerViewModel(super.state);

  void notifyChangeStartTime(DateTime time) {
    DateTime? endTime = state?.endTime;
    state = PickerModel(
      startTime: time,
      endTime: endTime,
    );
  }

  void notifyChangeEndTime(DateTime time) {
    DateTime? startTime = state?.startTime;
    state = PickerModel(
      endTime: time,
      startTime: startTime,
    );
  }
}
