import 'package:get/state_manager.dart';
import 'package:learn_getx/model/posts_model.dart';
import 'package:learn_getx/repository/api_respository.dart';

class PostController extends GetxController {
  RxList<PostsModel> postList = <PostsModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    postList.value = await ApiRespository.getPostData();
  }
}
