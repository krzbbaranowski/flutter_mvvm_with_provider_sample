import 'package:pb_flutter_mvvm_provider/models/posts.dart';

class PostsRepository {
  final _posts = [
    const Post(1, "Post 1",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
    const Post(2, "Post 2",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
    const Post(3, "Post 3",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
    const Post(4, "Post 4",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
  ];

  Future<Posts> getPosts() {
    _posts.shuffle();
    return Future.value(Posts(_posts));
  }

  Future<Post> getPost(int postId) {
    return Future.value(_posts.firstWhere((element) => element.id == postId));
  }
}
