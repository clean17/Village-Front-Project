import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/main/home_page/home_page_view_model.dart';
import 'package:village/view/pages/main/home_page/widgets/place_container.dart';

class UserScrapBody extends ConsumerWidget {
  const UserScrapBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomePageModel? pm = ref.watch(homePageProvider);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => PlaceContainer(place: pm),
      ),
    );
  }
}
