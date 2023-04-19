import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:village/view/widgets/place_appbar.dart';

// 원래 권한 요구 였나 ?
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}

class MapNearbyPlacePage extends StatefulWidget {
  const MapNearbyPlacePage({Key? key, required}) : super(key: key);

  @override
  State<MapNearbyPlacePage> createState() => _MapNearbyPlacePageState();
}

class _MapNearbyPlacePageState extends State<MapNearbyPlacePage> {
  late GoogleMapController _controller;
  late LatLng currentLocation;
  // final bool _myLocationEnabled = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
    // first();
  }

  // void first() {
  //   final cameraPosition = CameraPosition(
  //     target: currentLocation,
  //     zoom: 18,
  //   );
  //   _controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  // }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              target: currentLocation, // 서울 시청 위치
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
          // Positioned(
          //   bottom: 150,
          //   right: 6,
          //   child: FloatingActionButton(
          //     onPressed: _getCurrentLocation,
          //     foregroundColor: Colors.black,
          //     backgroundColor: Colors.white,
          //     elevation: 8,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10), // 버튼 모서리 둥글기
          //     ), // 그림자 크기
          //     child: const Icon(Icons.my_location),
          //   ),
          // ),
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
      ),
    );
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
