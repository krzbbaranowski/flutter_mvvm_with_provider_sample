import 'package:pb_flutter_mvvm_provider/models/posts.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_base.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'posts_state.g.dart';

@CopyWith()
class PostsState extends StateData {
  final Posts posts;
  final bool isLoading;

  const PostsState(this.posts, this.isLoading);

  factory PostsState.initial() => const PostsState(Posts([]), true);

  @override
  List<Object?> get props => [posts, isLoading];

  @override
  bool? get stringify => false;
}
