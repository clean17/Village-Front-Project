import 'package:flutter/material.dart';

class OtherChat extends StatelessWidget {
  const OtherChat(
      {Key? key, required this.name, required this.text, required this.time})
      : super(key: key);

  final name;
  final text;
  final time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(
              // backgroundImage: NetworkImage(friends[0].backgroundImage),
              ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Text(text),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
