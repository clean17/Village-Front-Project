import 'package:flutter/material.dart';
import 'package:village/view/pages/main/home_page/widgets/home_body.dart';
import 'package:village/view/widgets/main_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items =
      List<String>.generate(20, (index) => 'Item $index');

  Future<void> _refreshItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      items.insert(0, 'New Item');
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _refreshItems,
        child: Scaffold(
          appBar: MainAppbar(context),
          body: const HomeBody(),
        ));
  }
}
