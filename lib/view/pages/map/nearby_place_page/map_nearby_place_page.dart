import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/view/pages/map/nearby_place_page/map_nearby_place_view_model.dart';
import 'package:village/view/widgets/place_appbar.dart';

class MapNearbyPlacePage extends ConsumerStatefulWidget {
  const MapNearbyPlacePage({Key? key, required}) : super(key: key);

  @override
  ConsumerState<MapNearbyPlacePage> createState() => _MapNearbyPlacePageState();
}

class _MapNearbyPlacePageState extends ConsumerState<MapNearbyPlacePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  bool _isPermissionGranted = false;
  LatLng _position = const LatLng(37.541, 126.986);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  // 사용자 정의 권한 요청 다이얼로그
  Future<void> _getCurrentLocation() async {
    final vm = ref.read(mapNearbyProvider.notifier);
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 활성화 여부 묻기
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showToast('위치 정보를 가져올 수 없습니다.');
      return Future.error('위치 정보를 가져올 수 없습니다.');
    }

    // 권한 필요
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // 수정
      // 권한 요청 다이얼로그 생성
      // await requestLocationPermissionWithCustomDialog(context);
      permission = await Geolocator.requestPermission();
      // permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        // showToast('위치 정보를 가져올 권한이 없습니다.');
        return Future.error('위치 정보를 가져올 권한이 없습니다.');
      }
    }

    // 권한이 거절되어 있는 상태니 ?
    if (permission == LocationPermission.deniedForever) {
      return Future.error('위치 정보를 영구적으로 가져오지 못하는 상태입니다.');
    }

    // setState(() {
    //   _isPermissionGranted = true;
    // });

    // 좌표 가져오기
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _isPermissionGranted = true;
      _position = LatLng(position.latitude, position.longitude);
    });
    vm.notifyAddLatLng(LatLng(position.latitude, position.longitude));

    // 위치 권한을 얻고 나서 내 위치를 가져오는데 내 위치를 프로바이더에 넣으면 watch가 안되는 ?
    // 아니면 PC라서 위치가 불러와 지지 않는것 ? -> 앱설정의 set location으로 위치 변경 가능
    // r
  }

  @override
  Widget build(BuildContext context) {
    final pm = ref.watch(mapNearbyProvider);
    _position = pm.xy!;

    // List<Map<String, dynamic>> places = [
    //   {
    //     'name': 'Place 1',
    //     'latitude': 37.532600,
    //     'longitude': 127.024612,
    //   },
    //   {
    //     'name': 'Place 2',
    //     'latitude': 37.532700,
    //     'longitude': 127.024712,
    //   },
    //   {
    //     'name': 'Place 3',
    //     'latitude': 37.532800,
    //     'longitude': 127.024812,
    //   },
    //   {
    //     'name': 'Place 4',
    //     'latitude': 37.532900,
    //     'longitude': 127.024912,
    //   },
    //   {
    //     'name': 'Place 5',
    //     'latitude': 37.533000,
    //     'longitude': 127.025012,
    //   },
    //   {
    //     'name': 'Place 6',
    //     'latitude': 37.533100,
    //     'longitude': 127.025112,
    //   },
    // ];
    return Scaffold(
        appBar: placeAppbar(),
        body: _isPermissionGranted
            ? Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _position,
                      zoom: 17,
                    ),
                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
                    // myLocationButtonEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    // markers: <Marker>{
                    //   Marker(
                    //     markerId: MarkerId('myMarker'),
                    //     position: pm.xy!,
                    //     infoWindow: InfoWindow(
                    //       title: 'My Location',
                    //       snippet:
                    //           'Lat: ${pm.xy!.latitude}, Lng: ${pm.xy!.longitude}',
                    //     ),
                    //   ),
                    // },
                    // markers: Set<Marker>.of(places.map((place) {
                    //   return Marker(
                    //     markerId: MarkerId(place['name']),
                    //     position: LatLng(place['latitude'], place['longitude']),
                    //     infoWindow: InfoWindow(title: place['name']),
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           CupertinoPageRoute(
                    //               builder: (context) => const MarkerDetailScreen()));
                    //     },
                    //   );
                    // })),
                  ),
                  // Positioned(
                  //   bottom: 150,
                  //   right: 6,
                  //   child: FloatingActionButton(
                  //     onPressed: () async {
                  //       _getCurrentLocation();
                  //       final GoogleMapController controller =
                  //           await _controller.future;
                  //       controller.animateCamera(CameraUpdate.newCameraPosition(
                  //           CameraPosition(target: pm.xy!, zoom: 18)));
                  //     },

                  //     foregroundColor: Colors.black,
                  //     backgroundColor: Colors.white,
                  //     elevation: 8,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10), // 버튼 모서리 둥글기
                  //     ), // 그림자 크기
                  //     child: const Icon(Icons.my_location),
                  //   ),
                  // ),
                ],
              )
            : GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(37.541, 126.986),
                  zoom: 17,
                ),
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ));
  }
}

class MarkerDetailScreen extends StatelessWidget {
  const MarkerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marker Detail'),
      ),
      body: const Center(
        child: Text('Marker detail screen'),
      ),
    );
  }
}
