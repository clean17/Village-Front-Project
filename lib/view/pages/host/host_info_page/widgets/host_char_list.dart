import 'package:flutter/material.dart';

class HostCharList extends StatelessWidget {
  const HostCharList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(5, (index) => Container(
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
        // padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: ListTile(
          title: Row(
            children: [
              Text("김땡땡"),
              Spacer(),
              Text("12:50", style: TextStyle(color: Colors.grey),)
            ],
          ),
          subtitle: Text("저기요 주차장 있나요?"),
        ),
        )),
    );
  }
}

