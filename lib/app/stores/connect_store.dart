

import 'package:mobx/mobx.dart';

import '../services/firebase_functions.dart';

part "connect_store.g.dart";

class ConnectionStore = _ConnectionStore with _$ConnectionStore;

abstract class _ConnectionStore with Store {
  final FirebaseFunctions service = FirebaseFunctions();
  
  @observable
  ObservableList followerList = ObservableList();

  @observable
  ObservableList followingList = ObservableList();

  @observable
  bool isLoading = true;


  @action
  Future fetchFollower(String userId) async {
    followerList.clear();
    isLoading = true;

    final result =await service.followerList(userId);
    isLoading = false;

    followerList.addAll(result);
    return true;
  }


  @action
  Future fetchFollowing(String userId) async {
    followingList.clear();
    isLoading = true;

    final result = await service.followingList(userId);
    isLoading = false;

    followingList.addAll(result);
    return true;
  }

  @action 
   Future unFollowUser(String unfollowUserId) async {
    await service.unfollowUser(unfollowUserId: unfollowUserId );
  }
  @action 
   Future removeFollowUser(String unfollowUserId) async {
    await service.removeFollowUser(removeFollowUser: unfollowUserId );
  }

}
