import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controllers/post_controller.dart';

class PostsView extends StatelessWidget {
  PostsView({super.key});
  final postController = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Posts')),
      body: Obx(
        () => ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final item = postController.postList[index];
            return ListTile(
              tileColor: Colors.grey.shade100,
              leading: CircleAvatar(child: Text('${item.id}')),
              title: Text('${item.title}'),
              subtitle: Text('${item.body}'),
            );
          },
        ),
      ),
    );
  }
}
