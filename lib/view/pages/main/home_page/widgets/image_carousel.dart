import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/dummy/home_page_data.dart';
import 'package:village/view/pages/main/home_page/widgets/indicator_dot.dart';

class ImageCarousel extends ConsumerStatefulWidget {
  const ImageCarousel({
    super.key,
    required this.images,
  });

  final images;

  @override
  ConsumerState<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends ConsumerState<ImageCarousel> {
  int _currentPage = 0;
  // List<String> downImages = images? [];

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
              widget.images?.length == 0
                  ? mainImage[index]
                  : widget.images?[index].fileUrl,
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          bottom: 16,
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
