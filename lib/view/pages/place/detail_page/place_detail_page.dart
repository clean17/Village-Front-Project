import 'package:flutter/material.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PlaceDetailBody(),
    );
  }
}
