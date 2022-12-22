import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pb_flutter_mvvm_provider/models/posts.dart';
import 'package:pb_flutter_mvvm_provider/features/post_details/posts_details_state.dart';
import 'package:pb_flutter_mvvm_provider/features/post_details/posts_details_viewmodel.dart';
import 'package:pb_flutter_mvvm_provider/features/posts/posts_state.dart';
import 'package:pb_flutter_mvvm_provider/features/posts/posts_viewmodel.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/mvvm_page.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_base.dart';
import 'package:pb_flutter_mvvm_provider/navparams/post_details_nav_param.dart';
import 'package:provider/provider.dart';

class PostsDetailsPage extends ParamStatefulWidget<PostDetailsNavParam> {
  const PostsDetailsPage(super.param, {super.key});

  @override
  PBMVVMPage<ParamStatefulWidget, PBViewModelBase<dynamic, StateData>, dynamic,
      StateData> createMVVMState() => _PostsDetailsPageState();
}

class _PostsDetailsPageState extends PBMVVMPage<PostsDetailsPage,
    PostsDetailsViewModel, PostDetailsNavParam, PostsDetailsState> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Details")),
        body: Consumer<PostsDetailsState>(
            builder: (context, PostsDetailsState state, _) {
          return _buildContent(state);
        }));
  }

  Widget _buildContent(PostsDetailsState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text(state.post.title,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange))),
          Expanded(
            child: Text(
              state.post.description,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(130, 50),
                    backgroundColor: Colors.green,
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () => viewModel.refreshPost(),
                child: Text("Refresh")),
          )
        ],
      ),
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
          // onTap: () => viewModel.selectPost(post),
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
