// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/model/place/place.dart';
import 'package:village/provider/session_provider.dart';

final placeDetailPageProvider = StateNotifierProvider.autoDispose<
    PlaceDetailPageViewModel, PlaceDetailPageModel>((ref) {
  //placeId
  SessionUser sessionUser = ref.read(sessionProvider);
  return PlaceDetailPageViewModel(PlaceDetailPageModel(isscrolled: false));
  // ..notifyInit(sessionUser.jwt);
});

// 창고 데이터
class PlaceDetailPageModel {
  Place? place;
  bool isscrolled;
  // String? resevasionDate;
  PlaceDetailPageModel({
    this.place,
    this.isscrolled = false,
    // this.resevasionDate,
  });
}

// 창고
class PlaceDetailPageViewModel extends StateNotifier<PlaceDetailPageModel> {
  PlaceDetailPageViewModel(super.state);

  // void notifyInit(int id, String jwt) async {
  //   ResponseDTO responseDTO = await PlaceRepository().fetchPost(id, jwt);
  //   state = PlaceDetailPageModel(place: responseDTO.data, tabNum: );
  // }

  // void notifyRemove(int id){
  //   Place place = state!.place;
  //   if(place.id == id){
  //     state = null;
  //   }
  // }

  // api 수정 요청 -> 수정된 Post를 돌려받음.
  // void notifyUpdate(Place updatePost){
  //   state = PlaceDetailPageModel(place: updatePost);
  // }

  // void notifyInit(String? jwt) async {
  //   // 토큰은 추후에
  //   ResponseDTO responseDTO = await PlaceRepository().fetchDetail();
  //   state = PlaceDetailPageModel(place: responseDTO.data);
  // }

  void notifyAdd(Place place) {
    bool? isscrolled = state.isscrolled;
    state = PlaceDetailPageModel(place: place, isscrolled: isscrolled);
  }

  void changeScrolled(bool scrolled) {
    Place? place = state.place;
    state = PlaceDetailPageModel(place: place, isscrolled: scrolled);
  }

  // void reservationDate(String input) {
  //   Logger().d('값 변경됨');
  //   state = PlaceDetailPageModel(resevasionDate: input);
  // }
}
