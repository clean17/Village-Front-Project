import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/view/pages/map/nearby_place_page/map_nearby_place_view_model.dart';
import 'package:village/view/widgets/place_appbar.dart';

class MapNearbyPlacePage extends ConsumerWidget {
  MapNearbyPlacePage({Key? key, required}) : super(key: key);

  @override
  late GoogleMapController _controller;

  Future<void> _getCurrentLocation(MapNearbyPlacePageViewModel vm) async {
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
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showToast('위치 정보를 가져올 권한이 없습니다.');
        return Future.error('위치 정보를 가져올 권한이 없습니다.');
      }
    }

    // 권한이 거절되어 있는 상태니 ?
    if (permission == LocationPermission.deniedForever) {
      return Future.error('위치 정보를 영구적으로 가져오지 못하는 상태입니다.');
    }

    // 좌표 가져오기
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    vm.notifyAddLatLng(LatLng(position.latitude, position.longitude));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MapNearbyPlacePageModel pm = ref.watch(mapNearbyProvider);
    MapNearbyPlacePageViewModel vm = ref.read(mapNearbyProvider.notifier);

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
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: pm.xy, // 서울 시청 위치
                zoom: 18,
              ),
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
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
              onMapCreated: (controller) => _controller = controller,
            ),
            Positioned(
              bottom: 200,
              right: 6,
              child: FloatingActionButton(
                onPressed: () {
                  _getCurrentLocation(vm);
                },
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // 버튼 모서리 둥글기
                ), // 그림자 크기
                child: const Icon(Icons.my_location),
              ),
            ),
            // 검색바 만들기
            // Positioned(
            //   top: 54,
            //   child: CupertinoButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           CupertinoPageRoute(
            //               builder: (context) => const MarkerDetailScreen()));
            //     },
            //     child: Container(
            //       width: MediaQuery.of(context).size.width - 21,
            //       height: 44,
            //       decoration: const BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.all(Radius.circular(8))),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: const [
            //           Padding(
            //             padding: EdgeInsets.only(left: 16.0),
            //             child: Text(
            //               '위치 검색',
            //               style: TextStyle(
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w600,
            //                 color: Colors.grey,
            //               ),
            //             ),
            //           ),
            //           Spacer(),
            //           Padding(
            //             padding: EdgeInsets.only(right: 13.0),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
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

class marker_widget extends StatelessWidget {
  const marker_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
