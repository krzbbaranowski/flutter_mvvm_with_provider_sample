import 'package:pb_flutter_mvvm_provider/models/posts.dart';
import 'package:pb_flutter_mvvm_provider/features/base/viewmodel_base.dart';
import 'package:pb_flutter_mvvm_provider/features/post_details/posts_details_state.dart';
import 'package:pb_flutter_mvvm_provider/navparams/post_details_nav_param.dart';
import 'package:pb_flutter_mvvm_provider/repositories/posts_repository.dart';

class PostsDetailsViewModel
    extends ViewModelBase<PostDetailsNavParam, PostsDetailsState> {
  final PostsRepository _postsRepository;

  Post? _post;

  PostsDetailsViewModel(this._postsRepository)
      : super(PostsDetailsState.initial());

  @override
  Future<void> initialize(PostDetailsNavParam parameter) async {
    _post = await _postsRepository.getPost(parameter.postId);
    stateData = stateData.copyWith(post: _post);
  }

  void refreshPost() {
    if (_post != null) {
      _post = Post(_post!.id, _post!.title,
          "${_post!.description} \n\n<Description updated at ${DateTime.now().toIso8601String()}>");
      stateData = stateData.copyWith(post: _post);
    }
  }
}
