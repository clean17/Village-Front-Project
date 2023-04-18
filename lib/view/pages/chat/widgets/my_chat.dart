import 'package:flutter/material.dart';

class MyChat extends StatelessWidget {
  const MyChat({Key? key, required this.text, required this.time})
      : super(key: key);

  final text;
  final time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            time,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(text),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.yellow,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
