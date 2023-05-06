// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

final mapNearbyProvider = StateNotifierProvider.autoDispose<
    MapNearbyPlacePageViewModel, MapNearbyPlacePageModel>((_) {
  return MapNearbyPlacePageViewModel(
      MapNearbyPlacePageModel(xy: const LatLng(37.541, 126.986)));
});

// 창고 데이터
class MapNearbyPlacePageModel {
  LatLng xy;
  MapNearbyPlacePageModel({
    required this.xy,
  });
}

// 창고 - 관리
class MapNearbyPlacePageViewModel
    extends StateNotifier<MapNearbyPlacePageModel> {
  MapNearbyPlacePageViewModel(super.state);

  void notifyAddLatLng(LatLng xy) {
    state = MapNearbyPlacePageModel(
      xy: xy,
    );
    Logger().d("프로바이더 : 내 위치 호출");
  }

  // void notifyInit() {
  //   state = MapNearbyPlacePageModel();
  // }
}
