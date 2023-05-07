import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/dummy/home_page_data.dart';
import 'package:village/view/pages/main/home_page/widgets/indicator_dot.dart';

class ImageCarousel extends ConsumerStatefulWidget {
  const ImageCarousel({
    super.key,
    required this.images,
  });

  // 빈 리스트 가능성 []
  final images;

  @override
  ConsumerState<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends ConsumerState<ImageCarousel> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final imageList = [];
    if (widget.images.length == 0 && widget.images.isEmpty) {
      imageList.add(mainImage[2]);
    } else {
      for (var e in widget.images) {
        imageList.add(e.fileUrl);
      }
    }
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          // 이미지리스트가 존재하면
          itemCount: imageList.length,
          onPageChanged: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              fit: BoxFit.cover,
              // 다운받기 전 임시 사진
              placeholder: (context, url) => Image.asset(
                'assets/images/a2.jpeg',
                fit: BoxFit.cover,
              ),
              // 실제 사진 있으면 다운 받기
              imageUrl: imageList[index],
              // Url 이 잘못됐다 ? -> 임시 사진
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/a2.jpeg',
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        Positioned(
          bottom: 16,
          child: Row(
            children: List.generate(
                imageList.length,
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
