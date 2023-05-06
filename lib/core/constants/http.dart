import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dio = Dio(BaseOptions(
  // baseUrl: "http://43.201.97.42",
  // baseUrl: "http://192.168.200.124",
  baseUrl: "http://192.168.219.108:8081",
  contentType: "application/json; charset=utf-8",
));

const secureStorage = FlutterSecureStorage(); // 디바이스 저장소에 접근
