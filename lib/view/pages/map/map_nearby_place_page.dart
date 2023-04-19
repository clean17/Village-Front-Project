import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapNearbyPlacePage extends StatelessWidget {
//   const MapNearbyPlacePage({super.key});

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition();
//   }

//   Future<void> getLocation() async {
//     LocationPermission permission = await Geolocator.requestPermission();
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print(position);
//   }

//   final position = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             const Text('zzzzzzzzz'),
//             ElevatedButton(
//                 onPressed: () => getLocation(), child: const Text('zz12'))
//           ],
//         ),
//       ),
//     );
//   }

//   void main23() async {
//     const url =
//         'https://jsonplaceholder.typicode.com/todos/1'; // Replace with your actual API endpoint URL

//     final response = await http.get(
//       Uri.parse(url),
//     );

//     if (response.statusCode == 200) {
//       print('Response headers:');
//       response.headers.forEach((name, values) {
//         print('$name: $values');
//       });

//       print('Response body:');
//       print(response.body);
//     } else {
//       print('Error: ${response.statusCode}');
//     }
// Map<String, dynamic> test = {
//   "response.statusCode":response.statusCode,
//   'Response headers':{
//     'name':response.headers.name,

//   }
// };
// return test;

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
