import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:engas_task/core/networking/api_constants.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  post({required endPoint, required Map<String, dynamic> data}) async {
    final response = await dio.post('${ApiConstants.apiBaseUrl}$endPoint', data: data);

    return json.decode(response.data);
  }
}