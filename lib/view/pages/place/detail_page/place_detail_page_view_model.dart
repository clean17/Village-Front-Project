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
  PlaceDetailPageModel({
    this.place,
    this.isscrolled = false,
  });
}

// 창고
class PlaceDetailPageViewModel extends StateNotifier<PlaceDetailPageModel> {
  PlaceDetailPageViewModel(super.state);

  void notifyAdd(Place place) {
    bool? isscrolled = state.isscrolled;
    state = PlaceDetailPageModel(place: place, isscrolled: isscrolled);
  }

  void changeScrolled(bool scrolled) {
    Place? place = state.place;
    state = PlaceDetailPageModel(place: place, isscrolled: scrolled);
  }
}
