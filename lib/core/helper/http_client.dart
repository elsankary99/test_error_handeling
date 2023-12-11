import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tost/core/helper/api_exception.dart';

Future<Response<T>> validateError<T>(
    Future<Response> Function() request) async {
  try {
    final res = await request();
    if (res.statusCode == HttpStatus.internalServerError) {
      throw InternalServerError();
    }
    if (res.statusCode == HttpStatus.notFound) {
      throw NotFound();
    }
    return res as Response<T>;
  } on SocketException {
    throw NotInterNetConnection();
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      throw NotInterNetConnection();
    }
    rethrow;
  }
}

class CustomHttpClient {
  final Dio dio;

  CustomHttpClient({required this.dio});

  Future<Response<T>> get<T>(String path) async {
    return await validateError(
      () async => await dio.get(path),
    );
  }
}
