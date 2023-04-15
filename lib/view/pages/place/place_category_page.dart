import 'package:flutter/material.dart%20';
import 'package:flutter/services.dart';
import 'package:village/core/color.dart';
import 'package:village/view/pages/search/search_result_page.dart';
import 'package:village/view/widgets/main/place_container.dart';

class PlaceCategoryPage extends StatefulWidget {
  const PlaceCategoryPage({super.key});

  @override
  State<PlaceCategoryPage> createState() => _PlaceCategoryPageState();
}

class _PlaceCategoryPageState extends State<PlaceCategoryPage> {
  final _cities = ['연습실', '공유오피스', '사무실'];

  dynamic _selectedCity = '연습실';

  @override
  Widget build(BuildContext context) {
    final double mWeith = MediaQuery.of(context).size.width;
    late double rpadding = mWeith * 0.5;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
          color: Colors.black,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarIconBrightness: Brightness.light, // 최상단
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: DropdownButton(
          value: _selectedCity,
          items: _cities
              .map((e) => DropdownMenuItem(
                    value: e, // 선택 시 onChanged 를 통해 반환할 value
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {
            // items 의 DropdownMenuItem 의 value 반환
            setState(() {
              _selectedCity = value!;
            });
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            // pinned: true,
            snap: true,
            floating: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: [
              MyTextButton(
                color: kPrimaryColor,
                text: '지역검색',
              ),
              MyTextButton(
                color: kPrimaryColor,
                text: '필터링',
              ),
            ],
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const Card(
                  child: PlaceContainer(),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
