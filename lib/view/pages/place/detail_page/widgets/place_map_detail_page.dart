import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceMapDetailPage extends StatefulWidget {
  const PlaceMapDetailPage({Key? key, required}) : super(key: key);

  @override
  State<PlaceMapDetailPage> createState() => _PlaceMapDetailPageState();
}

class _PlaceMapDetailPageState extends State<PlaceMapDetailPage> {
  late GoogleMapController _controller;
  late LatLng currentLocation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> places = [
      {
        'name': 'Place 1',
        'latitude': 37.532600,
        'longitude': 127.024612,
      },
    ];
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(37.532600, 127.024612), // 서울 시청 위치
        zoom: 18,
      ),
      zoomControlsEnabled: false,
      // myLocationEnabled: true,
      myLocationButtonEnabled: false,
      markers: Set<Marker>.of(places.map((place) {
        return Marker(
          markerId: MarkerId(place['name']),
          position: LatLng(place['latitude'], place['longitude']),
          infoWindow: InfoWindow(title: place['name']),
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => const MarkerDetailScreen()));
          },
        );
      })),
      // onMapCreated: (controller) => _controller = controller,
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
