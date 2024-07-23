import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  final Dio dio = Dio();

  DioClient() {
    configureEndpointVariable();
  }

  void configureEndpointVariable() {
    dio.options =
        BaseOptions(baseUrl: 'https://api.cryptorank.io/v1/', queryParameters: {
      "api_key": dotenv.env['CRYPTO_RANK_API_KEY'],
      "validateStatus": (status) {
        return status! < 500;
      },
    });
  }

  
}
