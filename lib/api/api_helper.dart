import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_music/app/build_config.dart';

class ApiHelper {
  static ApiHelper _instance;
  Dio _dio = new Dio();

  static ApiHelper get instance {
    if (_instance == null) {
      _instance = ApiHelper._();
    }
    return _instance;
  }

  ApiHelper._() {
    _dio.options.baseUrl = "http://apidev.snailpet.cn/";
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
    _dio.options.contentType = ContentType.json.toString();
    // 添加拦截器
    _dio.interceptors.add(LogInterceptor(
        requestBody: BuildConfig.DEBUG, responseBody: BuildConfig.DEBUG));
  }

  Dio dio() {
    return _dio;
  }
}
