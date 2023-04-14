import 'package:flutter/material.dart';
import 'package:village/core/style.dart';

Widget placeInfo() {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 25.0,
    ),
    child: SizedBox(
      child: Column(children: [
        Row(
          children: [
            const Text(
              "마포구",
              style: mgrey_text,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 1,
                  height: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            const Text(
              "촬영스튜디오, 렌탈스튜디오",
              style: mgrey_text,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "스튜디오 르온드",
                style: mplace_title,
              )),
        ),
        Row(children: const [
          Icon(Icons.star, color: Colors.amber),
          Text(
            "5.0(1)",
            style: TextStyle(fontSize: 16),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black54,
            size: 16,
          ),
          Icon(
            Icons.map_outlined,
            color: Colors.red,
            size: 16,
          ),
          Text(
            "위치보기",
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.red,
            size: 16,
          ),
        ]),
      ]),
    ),
  );
}
