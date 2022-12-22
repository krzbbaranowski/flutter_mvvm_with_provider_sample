import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:pb_flutter_mvvm_provider/models/posts.dart';
import 'package:pb_flutter_mvvm_provider/features/posts/posts_state.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_base.dart';

part 'posts_details_state.g.dart';

@CopyWith()
class PostsDetailsState extends StateData {
  final Post post;
  final bool isEditable;

  const PostsDetailsState(this.post, this.isEditable);

  factory PostsDetailsState.initial() =>
      const PostsDetailsState(Post(1, "", ""), false);

  @override
  List<Object?> get props => [post, isEditable];
}
