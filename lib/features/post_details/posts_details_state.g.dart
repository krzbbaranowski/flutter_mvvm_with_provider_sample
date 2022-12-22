// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_details_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostsDetailsStateCWProxy {
  PostsDetailsState post(Post post);

  PostsDetailsState isEditable(bool isEditable);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostsDetailsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostsDetailsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PostsDetailsState call({
    Post? post,
    bool? isEditable,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostsDetailsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPostsDetailsState.copyWith.fieldName(...)`
class _$PostsDetailsStateCWProxyImpl implements _$PostsDetailsStateCWProxy {
  const _$PostsDetailsStateCWProxyImpl(this._value);

  final PostsDetailsState _value;

  @override
  PostsDetailsState post(Post post) => this(post: post);

  @override
  PostsDetailsState isEditable(bool isEditable) => this(isEditable: isEditable);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostsDetailsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostsDetailsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PostsDetailsState call({
    Object? post = const $CopyWithPlaceholder(),
    Object? isEditable = const $CopyWithPlaceholder(),
  }) {
    return PostsDetailsState(
      post == const $CopyWithPlaceholder() || post == null
          // ignore: unnecessary_non_null_assertion
          ? _value.post!
          // ignore: cast_nullable_to_non_nullable
          : post as Post,
      isEditable == const $CopyWithPlaceholder() || isEditable == null
          // ignore: unnecessary_non_null_assertion
          ? _value.isEditable!
          // ignore: cast_nullable_to_non_nullable
          : isEditable as bool,
    );
  }
}

extension $PostsDetailsStateCopyWith on PostsDetailsState {
  /// Returns a callable class that can be used as follows: `instanceOfPostsDetailsState.copyWith(...)` or like so:`instanceOfPostsDetailsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostsDetailsStateCWProxy get copyWith =>
      _$PostsDetailsStateCWProxyImpl(this);
}
