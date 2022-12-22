// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostsStateCWProxy {
  PostsState posts(Posts posts);

  PostsState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PostsState call({
    Posts? posts,
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPostsState.copyWith.fieldName(...)`
class _$PostsStateCWProxyImpl implements _$PostsStateCWProxy {
  const _$PostsStateCWProxyImpl(this._value);

  final PostsState _value;

  @override
  PostsState posts(Posts posts) => this(posts: posts);

  @override
  PostsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PostsState call({
    Object? posts = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return PostsState(
      posts == const $CopyWithPlaceholder() || posts == null
          // ignore: unnecessary_non_null_assertion
          ? _value.posts!
          // ignore: cast_nullable_to_non_nullable
          : posts as Posts,
      isLoading == const $CopyWithPlaceholder() || isLoading == null
          // ignore: unnecessary_non_null_assertion
          ? _value.isLoading!
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $PostsStateCopyWith on PostsState {
  /// Returns a callable class that can be used as follows: `instanceOfPostsState.copyWith(...)` or like so:`instanceOfPostsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostsStateCWProxy get copyWith => _$PostsStateCWProxyImpl(this);
}
