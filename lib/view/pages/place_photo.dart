import 'package:flutter/material.dart';

List<Widget> placePhoto(context, innerBoxIsScrolled) {
  return [
    SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Scaffold(
          extendBodyBehindAppBar: true,
          body: PageView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Image.network(
                "https://picsum.photos/id/${index + 1}/200/300",
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    ),
  ];
}
