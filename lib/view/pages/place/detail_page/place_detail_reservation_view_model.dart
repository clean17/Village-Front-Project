// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/model/place/place.dart';

final placeDetailReservationProvider = StateNotifierProvider.autoDispose<
    PlaceDetailReservationViewModel, PlaceDetailReservationModel>((ref) {
  //placeId
  return PlaceDetailReservationViewModel(
      PlaceDetailReservationModel(isscrolled: false));
});

// 창고 데이터
class PlaceDetailReservationModel {
  Place? place;
  bool isscrolled;
  PlaceDetailReservationModel({
    this.place,
    this.isscrolled = false,
  });
}

// 창고
class PlaceDetailReservationViewModel
    extends StateNotifier<PlaceDetailReservationModel> {
  PlaceDetailReservationViewModel(super.state);

  // void notifyInit(int id, String jwt) async {
  //   ResponseDTO responseDTO = await PlaceRepository().fetchPost(id, jwt);
  //   state = PlaceDetailReservationModel(place: responseDTO.data, tabNum: );
  // }

  // void notifyInit(String? jwt) async {
  //   // 토큰은 추후에
  //   ResponseDTO responseDTO = await PlaceRepository().fetchDetail();
  //   state = PlaceDetailReservationModel(place: responseDTO.data);
  // }

  void notifyAdd(Place place) {
    bool? isscrolled = state.isscrolled;
    state = PlaceDetailReservationModel(place: place, isscrolled: isscrolled);
  }

  void changeScrolled(bool scrolled) {
    Place? place = state.place;
    state = PlaceDetailReservationModel(place: place, isscrolled: scrolled);
  }
}
