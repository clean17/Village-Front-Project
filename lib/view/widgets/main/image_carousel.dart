import 'package:flutter/material.dart';
import 'package:village/dummy/home_page_data.dart';
import 'package:village/view/widgets/main/indicator_dot.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    super.key,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          itemCount: 3,
          onPageChanged: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          itemBuilder: (context, index) {
            return Image.asset(
              mainImage[index],
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          bottom: 16,
          // right: 16,
          child: Row(
            children: List.generate(
                mainImage.length,
                    (index) => Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: IndicatorDot(isActive: index == _currentPage),
                )),
          ),
        ),
      ],
    );
  }
}