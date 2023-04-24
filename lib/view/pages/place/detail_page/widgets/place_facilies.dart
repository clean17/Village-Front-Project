import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

class PlaceFacilties extends StatelessWidget {
  const PlaceFacilties({
    super.key,
    required this.facilities,
  });

  final List<String> facilities;

  @override
  Widget build(BuildContext context) {
    return Container(
        key: indexKeyList[2],
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DivisionText(text: '<편의시설>'),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: facilities.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.wifi,
                          size: 40,
                          color: Colors.black54,
                        ),
                        Text(
                          facilities[index],
                          style: msmall_black_text,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
