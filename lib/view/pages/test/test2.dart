import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text(
              "예약 내역",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: const MyTabs(),
        ));
  }
}

class MyTabs extends StatefulWidget {
  const MyTabs({Key? key}) : super(key: key);

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabLabels = [
    '탭 1',
    '탭 2',
    '탭 3',
    '탭 4',
    '탭5',
    '탭6',
    '탭7',
    '탭8',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabLabels.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 열 개수
            childAspectRatio: 1.5, // 아이템 가로 세로 비율
            mainAxisSpacing: 10, // 아이템 간격
            crossAxisSpacing: 10,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tabController.animateTo(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Text('항목 $index'),
                ),
              ),
            );
          },
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              // 탭별 컨텐츠를 구현
              Container(
                child: const Center(
                  child: Text('탭 1 컨텐츠'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('탭 2 컨텐츠'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('탭 3 컨텐츠'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('탭 4 컨텐츠'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('탭 5 컨텐츠'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('탭 6 컨텐츠'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('탭 7 컨텐츠'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('탭 8 컨텐츠'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
