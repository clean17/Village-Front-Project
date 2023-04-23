import 'package:flutter/material.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

// List<GlobalKey> tabKeyList = List.generate(4, (index) => GlobalKey());
GlobalKey oneKey = GlobalKey();
GlobalKey twoKey = GlobalKey();
GlobalKey threeKey = GlobalKey();
GlobalKey fourKey = GlobalKey();

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: PlaceDetailBody(),
    );
  }
}
