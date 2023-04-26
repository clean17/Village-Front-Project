import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dio = Dio(BaseOptions(
  baseUrl: "http://13.209.26.206/",
  contentType: "application/json; charset=utf-8",
));

const secureStorage = FlutterSecureStorage(); // 디바이스 저장소에 접근
