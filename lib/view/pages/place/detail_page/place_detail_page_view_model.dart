// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';

final placeDetailPageProvider = StateNotifierProvider.autoDispose<
    PlaceDetailPageViewModel, PlaceDetailPageModel>((ref) {
  //placeId
  // SessionUser sessionUser = ref.read(sessionProvider);
  return PlaceDetailPageViewModel(PlaceDetailPageModel(isscrolled: false))
    ..inin();
  // ..notifyInit(postId, sessionUser.jwt!);
});

// 창고 데이터
class PlaceDetailPageModel {
  // Place place;
  bool isscrolled;
  PlaceDetailPageModel({
    // required this.place,
    this.isscrolled = false,
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

  void changeScrolled(bool scrolled) {
    state = PlaceDetailPageModel(isscrolled: scrolled);
  }

  void inin() {
    // Logger().d('널 아님');
  }
}
