import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class MapNearbyPlacePage extends StatelessWidget {
  const MapNearbyPlacePage({super.key});

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  final position = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text('zzzzzzzzz'),
            ElevatedButton(
                onPressed: () => getLocation(), child: const Text('zz12'))
          ],
        ),
      ),
    );
  }

  void main23() async {
    const url =
        'https://jsonplaceholder.typicode.com/todos/1'; // Replace with your actual API endpoint URL

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      print('Response headers:');
      response.headers.forEach((name, values) {
        print('$name: $values');
      });

      print('Response body:');
      print(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
    // Map<String, dynamic> test = {
    //   "response.statusCode":response.statusCode,
    //   'Response headers':{
    //     'name':response.headers.name,

    //   }
    // };
    // return test;
  }
}
