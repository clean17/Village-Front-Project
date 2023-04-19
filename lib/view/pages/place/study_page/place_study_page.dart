import 'package:flutter/material.dart';

class PlaceStudyPage extends StatelessWidget {
  const PlaceStudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Image.network(
              "https://picsum.photos/id/${index + 1}/200/150",
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
