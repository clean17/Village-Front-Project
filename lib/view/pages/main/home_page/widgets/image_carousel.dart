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

  @override
  Widget build(BuildContext context) {
    // 다운 받을 경우
    List<String> downImages = [];
    // if (widget.images?.length != 0) {
    //   for (var e in widget.images) {
    //     downImages = e.fileUrl;
    //   }
    // } else {
    downImages = mainImage;
    // }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          itemCount: downImages.length,
          onPageChanged: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          itemBuilder: (context, index) {
            return Image.asset(
              downImages[index],
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          bottom: 16,
          child: Row(
            children: List.generate(
                downImages.length,
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
