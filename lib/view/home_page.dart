import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:tost/provider/get_posts_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Posts")),
      body: ref.watch(getAllPostsProvider).when(
          data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(data[index].id.toString()),
                    title: Text(data[index].title ?? ""),
                  );
                },
              ),
          error: (error, _) => Center(
                child: Text(error.toString()),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
