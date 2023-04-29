// 창고 관리자
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/model/place/place.dart';

final hostResisterPlacePageProvider = StateNotifierProvider.autoDispose<
    HostResisterPlacePageViewModel, HostResisterPlacePageModel?>((ref) {
  return HostResisterPlacePageViewModel(null);
});

// 창고 데이터
class HostResisterPlacePageModel {
  Place? place; // 등록 후 상세 페이지로 전환 시 서버로부터 반환받은 데이터
  List<ImageReqDto>? images;
  List<XFile>? xFiles;
  List<File>? files = [];
  HostResisterPlacePageModel({
    this.place,
    this.images,
  });
}

// 창고 - 관리
class HostResisterPlacePageViewModel
    extends StateNotifier<HostResisterPlacePageModel?> {
  HostResisterPlacePageViewModel(super.state);

  // void notifyInit(int id, String jwt) async {
  //   ResponseDTO responseDTO = await PlaceRepository().fetchPost(id, jwt);
  //   state = HostResisterPlacePageModel(place: responseDTO.data, tabNum: );
  // }

  // void notifyRemove(int id){
  //   Place place = state!.place;
  //   if(place.id == id){
  //     state = null;
  //   }
  // }

  // api 수정 요청 -> 수정된 Post를 돌려받음.
  // void notifyUpdate(Place updatePost){
  //   state = HostResisterPlacePageModel(place: updatePost);
  // }

  void notifyChangeImages(List<File> files) {
    List<ImageReqDto> images = [];
    for (var element in files) {
      final file = element;
      final imageBytes = file.readAsBytesSync();
      final base64Image = base64Encode(imageBytes);

      ImageReqDto image = ImageReqDto(
        name: _getFileName(file),
        type: _getFileType(file),
        data: base64Image,
      );
      images.add(image);
    }
    state = HostResisterPlacePageModel(images: images);
  }

  void notifyAdd(Place place) {
    state = HostResisterPlacePageModel(place: place);
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
