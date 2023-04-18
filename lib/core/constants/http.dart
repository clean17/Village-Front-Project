import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dio = Dio(BaseOptions(
  baseUrl: "http://192.168.200.124:8080",
  contentType: "application/json; charset=utf-8",
));

const secureStorage = FlutterSecureStorage(); // 디바이스 저장소에 접근
