import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

class PlaceFacilties extends ConsumerWidget {
  const PlaceFacilties({
    super.key,
  });

// pm.place?.placeIntroductionInfo ??
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> facilities = [];
    PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
    for (var e in pm.place!.facilitys) {
      facilities.add(e.facilityName);
    }
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
                  Widget widget;
                  switch (pm.place?.facilitys[index].facilityName) {
                    case 'Wifi':
                      widget = Column(
                        children: [
                          const Icon(
                            Icons.wifi,
                            size: 40,
                            color: Colors.black54,
                          ),
                          Text(
                            pm.place?.facilitys[index].facilityName ?? "",
                            style: msmall_black_text,
                          ),
                        ],
                      );
                      break;
                    case '냉장고':
                      widget = Column(
                        children: [
                          Html(
                            data: '<i class="fa-solid fa-refrigerator"></i>',
                            style: {
                              'i.fa-solid.fa-refrigerator': Style(
                                fontFamily: 'Font Awesome 5 Free',
                                color: Colors.black,
                                fontSize: const FontSize(16.0),
                              ),
                            },
                          ),
                          Text(
                            pm.place?.facilitys[index].facilityName ?? "",
                            style: msmall_black_text,
                          ),
                        ],
                      );
                      break;
                    case '주차장':
                      widget = Column(
                        children: [
                          const Icon(
                            Icons.local_parking,
                            size: 40,
                            color: Colors.black54,
                          ),
                          Text(
                            pm.place?.facilitys[index].facilityName ?? "",
                            style: msmall_black_text,
                          ),
                        ],
                      );
                      break;
                    case '화장실':
                      widget = Column(
                        children: [
                          const Icon(
                            Icons.wc,
                            size: 40,
                            color: Colors.black54,
                          ),
                          Text(
                            pm.place?.facilitys[index].facilityName ?? "",
                            style: msmall_black_text,
                          ),
                        ],
                      );
                      break;
                    case '정수기':
                      widget = Column(
                        children: [
                          const Icon(
                            FontAwesomeIcons.tint,
                            size: 40.0,
                            color: Colors.blue,
                          ),
                          Text(
                            pm.place?.facilitys[index].facilityName ?? "",
                            style: msmall_black_text,
                          ),
                        ],
                      );
                      break;
                    default:
                      widget = const SizedBox();
                      break;
                  }

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                    child: widget,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
