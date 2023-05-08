import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

void main() async {
  Logger().d('테스트 실행');
  // 하다가 그만둠 이미지 받아야 하는데 ;;
  Future<void> fetchStaticMapImage() async {
    double lat = 27;
    double lng = 136;
    int zoom = 18;
    String url = "https://maps.googleapis.com/maps/api/staticmap";
    String apiKey = "키 입력해서 테스트 ";
    String parameters =
        "center=$lat,$lng&zoom=&size=400x400&markers=color:red%7Clabel:%7C$lat,$lng&key=$apiKey";
    String fullUrl = "$url?$parameters";

    try {
      Dio dio = Dio();
      Response response = await dio.get(fullUrl);
      Logger().d(response.data);
      if (response.statusCode == 200) {
        print("Image fetched successfully");
        // Handle the image response here, for example, save it to the file system.
      } else {
        print("Failed to fetch image. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching image: $e");
    }
  }
}
