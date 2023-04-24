import 'package:flutter/material.dart';
import 'package:village/view/pages/main/home_page/widgets/place_container.dart';

class UserScrapBody extends StatelessWidget {
  const UserScrapBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => PlaceContainer(),
      ),
    );
  }
}
