import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioHelperProvider = Provider<Dio>((ref) {
  final dio = Dio();

  return dio;
});
