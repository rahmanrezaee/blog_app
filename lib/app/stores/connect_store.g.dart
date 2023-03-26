// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectionStore on _ConnectionStore, Store {
  late final _$followerListAtom =
      Atom(name: '_ConnectionStore.followerList', context: context);

  @override
  ObservableList<dynamic> get followerList {
    _$followerListAtom.reportRead();
    return super.followerList;
  }

  @override
  set followerList(ObservableList<dynamic> value) {
    _$followerListAtom.reportWrite(value, super.followerList, () {
      super.followerList = value;
    });
  }

  late final _$followingListAtom =
      Atom(name: '_ConnectionStore.followingList', context: context);

  @override
  ObservableList<dynamic> get followingList {
    _$followingListAtom.reportRead();
    return super.followingList;
  }

  @override
  set followingList(ObservableList<dynamic> value) {
    _$followingListAtom.reportWrite(value, super.followingList, () {
      super.followingList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ConnectionStore.isLoading', context: context);

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

  late final _$fetchFollowerAsyncAction =
      AsyncAction('_ConnectionStore.fetchFollower', context: context);

  @override
  Future<dynamic> fetchFollower(String userId) {
    return _$fetchFollowerAsyncAction.run(() => super.fetchFollower(userId));
  }

  late final _$fetchFollowingAsyncAction =
      AsyncAction('_ConnectionStore.fetchFollowing', context: context);

  @override
  Future<dynamic> fetchFollowing(String userId) {
    return _$fetchFollowingAsyncAction.run(() => super.fetchFollowing(userId));
  }

  late final _$unFollowUserAsyncAction =
      AsyncAction('_ConnectionStore.unFollowUser', context: context);

  @override
  Future<dynamic> unFollowUser(String unfollowUserId) {
    return _$unFollowUserAsyncAction
        .run(() => super.unFollowUser(unfollowUserId));
  }

  late final _$removeFollowUserAsyncAction =
      AsyncAction('_ConnectionStore.removeFollowUser', context: context);

  @override
  Future<dynamic> removeFollowUser(String unfollowUserId) {
    return _$removeFollowUserAsyncAction
        .run(() => super.removeFollowUser(unfollowUserId));
  }

  @override
  String toString() {
    return '''
followerList: ${followerList},
followingList: ${followingList},
isLoading: ${isLoading}
    ''';
  }
}
