import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class HttpManager {
  final Dio dio;
  final Options? options;

  HttpManager({this.options, required this.dio});

  Future<Map<String, dynamic>> sendRequest({
    required String url,
    Options? options,
    Map? body,
  }) async {
    try {
      Response response = await dio.request(
        url,
        options: options,
        data: body,
      );

      return response.data;
    } on DioException catch (dioError) {
      log('''Falha ao processar requisição. 
        Tipo: ${options?.method}. Endpoint: $url.''', error: dioError.message);
      return dioError.response?.data ?? {};
    } catch (error) {
      log('''Falha ao executar requisição. 
        Tipo: ${options?.method}. Endpoint: $url.''', error: error.toString());
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
