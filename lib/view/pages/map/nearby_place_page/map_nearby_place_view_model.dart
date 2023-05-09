// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:village/model/map/map_xy.dart';

final mapNearbyProvider = StateNotifierProvider.autoDispose<
    MapNearbyPlacePageViewModel, MapNearbyPlacePageModel>((_) {
  return MapNearbyPlacePageViewModel(
      MapNearbyPlacePageModel(xy: const LatLng(37.541, 126.986)));
});

// 창고 데이터
class MapNearbyPlacePageModel {
  LatLng? xy;
  List<MapXy>? map;
  MapNearbyPlacePageModel({
    required this.xy,
    this.map,
  });
}

// 창고 - 관리
class MapNearbyPlacePageViewModel
    extends StateNotifier<MapNearbyPlacePageModel> {
  MapNearbyPlacePageViewModel(super.state);

  void notifyAddLatLng(LatLng xy) {
    List<MapXy>? map = state.map;
    state = MapNearbyPlacePageModel(xy: xy, map: map);
    Logger().d("프로바이더 : 내 위치 저장");
  }

  void notifyAddMapList(List<MapXy> map) {
    LatLng? xy = state.xy;
    state = MapNearbyPlacePageModel(xy: xy, map: map);
    Logger().d("프로바이더 : 맵 배열 저장");
  }
}
