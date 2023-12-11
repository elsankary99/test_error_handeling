import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tost/core/helper/dio_helper.dart';
import 'package:tost/core/helper/http_client.dart';

final customHttpClientProvider = Provider<CustomHttpClient>((ref) {
  return CustomHttpClient(dio: ref.read(dioHelperProvider));
});
