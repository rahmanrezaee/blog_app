// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReactionStore on _ReactionStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ReactionStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$likeListAtom =
      Atom(name: '_ReactionStore.likeList', context: context);

  @override
  ObservableList<String> get likeList {
    _$likeListAtom.reportRead();
    return super.likeList;
  }

  @override
  set likeList(ObservableList<String> value) {
    _$likeListAtom.reportWrite(value, super.likeList, () {
      super.likeList = value;
    });
  }

  late final _$commentListAtom =
      Atom(name: '_ReactionStore.commentList', context: context);

  @override
  ObservableList<CommentModel> get commentList {
    _$commentListAtom.reportRead();
    return super.commentList;
  }

  @override
  set commentList(ObservableList<CommentModel> value) {
    _$commentListAtom.reportWrite(value, super.commentList, () {
      super.commentList = value;
    });
  }

  late final _$getLikeAsyncAction =
      AsyncAction('_ReactionStore.getLike', context: context);

  @override
  Future<dynamic> getLike(String postId) {
    return _$getLikeAsyncAction.run(() => super.getLike(postId));
  }

  late final _$getCommentsPostAsyncAction =
      AsyncAction('_ReactionStore.getCommentsPost', context: context);

  @override
  Future<dynamic> getCommentsPost(String postId) {
    return _$getCommentsPostAsyncAction
        .run(() => super.getCommentsPost(postId));
  }

  late final _$likePostAsyncAction =
      AsyncAction('_ReactionStore.likePost', context: context);

  @override
  Future<dynamic> likePost(String postId) {
    return _$likePostAsyncAction.run(() => super.likePost(postId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
likeList: ${likeList},
commentList: ${commentList}
    ''';
  }
}
