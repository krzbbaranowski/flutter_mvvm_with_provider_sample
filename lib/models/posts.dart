import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String description;

  const Post(this.id, this.title, this.description);

  @override
  List<Object?> get props => [id, title, description];
}

class Posts extends Equatable {
  final List<Post> posts;

  const Posts(this.posts);

  @override
  List<Object?> get props => [posts];

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is List<Post> && listEquals(posts, other);
}
