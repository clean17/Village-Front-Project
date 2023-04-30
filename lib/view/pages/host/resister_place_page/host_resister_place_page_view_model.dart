// 창고 관리자
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/model/place/place.dart';

final hostResisterPlacePageProvider = StateNotifierProvider.autoDispose<
    HostResisterPlacePageViewModel, HostResisterPlacePageModel?>((ref) {
  return HostResisterPlacePageViewModel(null);
});

// 창고 데이터
class HostResisterPlacePageModel {
  Place? place; // 등록 후 상세 페이지로 전환 시 서버로부터 반환받은 데이터
  List<ImageReqDTO>? images;
  List<File>? files;
  List<HashtagReqDTO>? hashtag;
  HostResisterPlacePageModel({
    this.place,
    this.images,
    this.files,
    this.hashtag,
  });
}

// 창고 - 관리
class HostResisterPlacePageViewModel
    extends StateNotifier<HostResisterPlacePageModel?> {
  HostResisterPlacePageViewModel(super.state);

  void notifyAddHashtag(List<HashtagReqDTO> hashtags) {
    state = HostResisterPlacePageModel(hashtag: hashtags);
    Logger().d('프로바이더 : 해시태그 변경');
  }

  void notifyAddPlace(Place place) {
    state = HostResisterPlacePageModel(place: place);
  }

  void notifyChangeFile(List<File> files) {
    state = HostResisterPlacePageModel(files: files);
  }

  // 여기부터 이미지 변경
  void notifyChangeImages(List<File> files) {
    List<ImageReqDTO> images = [];
    for (var element in files) {
      final file = element;
      final imageBytes = file.readAsBytesSync();
      final base64Image = base64Encode(imageBytes);

      ImageReqDTO image = ImageReqDTO(
        name: _getFileName(file),
        type: _getFileType(file),
        data: base64Image,
      );
      images.add(image);
    }

    state = HostResisterPlacePageModel(images: images);
    Logger().d('프로바이더 : 이미지 변경');
  }

  String _getFileName(File file) {
    final path = file.path;
    return path.substring(path.lastIndexOf('/') + 1);
  }

  String _getFileType(File file) {
    final path = file.path;
    final extension = path.split('.').last.toLowerCase();

    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      default:
        return 'unknown';
    }
  }
}
