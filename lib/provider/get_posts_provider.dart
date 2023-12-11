import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tost/data/post_model.dart';
import 'package:tost/provider/service.dart';

final getAllPostsProvider = FutureProvider<List<PostModel>>((ref) async {
  final res = await ref
      .read(customHttpClientProvider)
      .get("https://jsonplaceholder.typicode.com/posts");
  final data = res.data as List;
  return data.map((e) => PostModel.fromMap(e)).toList();
});
