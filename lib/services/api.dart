import 'dart:developer';
import 'dart:io';

import 'package:cryptofolio/services/dio.dart';
import 'package:dio/dio.dart';

class ApiError extends Error {
  final int? statusCode;
  final dynamic data;

  ApiError(this.statusCode, this.data);

  @override
  String toString() {
    return 'API Error: Status Code $statusCode, Data: $data';
  }
}

class ApiService {
  DioClient dioClient = DioClient();
  ApiService() {
    dioClient = DioClient();
  }

  Future getReq(String url) async {
    // await dioClient.configureEndpointVariable();
    try {
      Dio dio = dioClient.dio;
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        if (response.statusCode == 401) {
          return getReq(url);
        } else {
          throw ApiError(response.statusCode, response.data);
        }
      }
    } catch (err) {
      print("$err");
    }
  }
}
