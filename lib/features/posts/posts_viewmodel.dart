import 'package:pb_flutter_mvvm_provider/models/posts.dart';
import 'package:pb_flutter_mvvm_provider/features/base/viewmodel_base.dart';
import 'package:pb_flutter_mvvm_provider/features/post_details/posts_details_page.dart';
import 'package:pb_flutter_mvvm_provider/features/posts/posts_state.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_base.dart';
import 'package:pb_flutter_mvvm_provider/navparams/post_details_nav_param.dart';
import 'package:pb_flutter_mvvm_provider/repositories/posts_repository.dart';

class PostsViewModel extends ViewModelBase<NoParam, PostsState> {
  final PostsRepository _postsRepository;

  PostsViewModel(this._postsRepository) : super(PostsState.initial());

  @override
  Future<void> initialize(NoParam parameter) async {
    _showLoading();
    await Future.delayed(const Duration(milliseconds: 800));
    var posts = await _postsRepository.getPosts();
    _hideLoading();

    stateData = stateData.copyWith(posts: posts);
    await Future.delayed(const Duration(milliseconds: 2000));

    var postsUpdated = await _postsRepository.getPosts();
    stateData = stateData.copyWith(posts: postsUpdated);
    return Future.value();
  }

  Future<void> selectPost(Post selectedPost) async {
    await navigationService
        .navigateToPage(PostsDetailsPage(PostDetailsNavParam(selectedPost.id)));
  }

  void _showLoading() {
    stateData = stateData.copyWith(isLoading: true);
  }

  void _hideLoading() {
    stateData = stateData.copyWith(isLoading: false);
  }
}
