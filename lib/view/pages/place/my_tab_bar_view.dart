import 'package:flutter/material.dart%20';

class MyTabBarView extends StatefulWidget {
  const MyTabBarView({super.key});

  @override
  _MyTabBarViewState createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: const [
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
                Text("zzzzz"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
