import 'package:flutter/material.dart';

SliverAppBar placeSliverAppbar() {
  return SliverAppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {},
      color: Colors.black,
    ),
    actions: const [
      Icon(Icons.link),
      SizedBox(
        width: 20,
      ),
      Icon(Icons.security_sharp),
      SizedBox(
        width: 15,
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    pinned: true,
    expandedHeight: 250.0,
    flexibleSpace: FlexibleSpaceBar(
      background: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Image.network(
            "https://picsum.photos/id/${index + 1}/200/300",
            fit: BoxFit.cover,
          );
        },
      ),
    ),
  );
}
