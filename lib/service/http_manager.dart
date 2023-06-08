import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class HttpManager {
  final Dio dio;

  HttpManager({required this.dio});

  Future<Map<String, dynamic>> sendRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    final defaulHeaders = headers?.cast<String, String>() ?? {};
    try {
      Response response = await dio.request(
        url,
        options: Options(method: method, headers: defaulHeaders),
        data: body,
      );

      return response.data;
    } on DioException catch (dioError) {
      log('''Falha ao processar requisição. 
        Tipo: $method. Endpoint: $url.''', error: dioError.message);
      return dioError.response?.data ?? {};
    } catch (error) {
      log('''Falha ao executar requisição. 
        Tipo: $method. Endpoint: $url.''', error: error.toString());
      return {};
    }
  }

  Map<String, dynamic> getSimpleAuthHeader(String user, String password) {
    return {
      'Authorization': 'Basic ${base64Encode(utf8.encode("$user:$password"))}'
    };
  }
}

abstract class HttpMethod {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
  static const String put = 'PUT';
}
