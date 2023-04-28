// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/model/place/place.dart';
import 'package:village/provider/session_provider.dart';

final hostResisterPlacePageProvider = StateNotifierProvider.autoDispose<
    HostResisterPlacePageViewModel, HostResisterPlacePageModel?>((ref) {
  SessionUser sessionUser = ref.read(sessionProvider);
  return HostResisterPlacePageViewModel(null, ref);
});

// 창고 데이터
class HostResisterPlacePageModel {
  Place place;
  HostResisterPlacePageModel({
    required this.place,
  });
}

// 창고 - 관리
class HostResisterPlacePageViewModel
    extends StateNotifier<HostResisterPlacePageModel?> {
  HostResisterPlacePageViewModel(super.state, this.ref);
  Ref ref;

  // void notifyInit(int id, String jwt) async {
  //   ResponseDTO responseDTO = await PlaceRepository().fetchPost(id, jwt);
  //   state = HostResisterPlacePageModel(place: responseDTO.data, tabNum: );
  // }

  // void notifyRemove(int id){
  //   Place place = state!.place;
  //   if(place.id == id){
  //     state = null;
  //   }
  // }

  // api 수정 요청 -> 수정된 Post를 돌려받음.
  // void notifyUpdate(Place updatePost){
  //   state = HostResisterPlacePageModel(place: updatePost);
  // }

  // void changeScrolled(bool scrolled) {
  //   state = HostResisterPlacePageModel(isscrolled: scrolled);
  // }

  // void reservationDate(String input) {
  //   Logger().d('값 변경됨');
  //   state = HostResisterPlacePageModel(resevasionDate: input);
  // }

  void notifyAdd(Place place) {
    state = HostResisterPlacePageModel(place: place);
  }

  void inin() {
    // Logger().d('널 아님');
  }
}
