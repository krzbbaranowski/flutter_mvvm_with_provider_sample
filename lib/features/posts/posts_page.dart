import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pb_flutter_mvvm_provider/models/posts.dart';
import 'package:pb_flutter_mvvm_provider/features/posts/posts_state.dart';
import 'package:pb_flutter_mvvm_provider/features/posts/posts_viewmodel.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/mvvm_page.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_base.dart';
import 'package:provider/provider.dart';

class PostsPage extends ParamStatefulWidget<NoParam> {
  const PostsPage(super.param, {super.key});

  @override
  PBMVVMPage<ParamStatefulWidget, PBViewModelBase<dynamic, StateData>, dynamic,
      StateData> createMVVMState() {
    return _PostsPageState();
  }
}

class _PostsPageState
    extends PBMVVMPage<PostsPage, PostsViewModel, NoParam, PostsState> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        body: Consumer<PostsState>(builder: (_, state, child) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildContent(state.posts.posts);
        }));
  }

  Widget _buildContent(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => _buildItem(posts[index]),
    );
  }

  Widget _buildItem(Post post) {
    final borderRadius = BorderRadius.circular(8.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: 5,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () => viewModel.selectPost(post),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Text(
                  post.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
