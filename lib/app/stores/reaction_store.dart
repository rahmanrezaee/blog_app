import 'package:mobx/mobx.dart';

import '../models/comment_model.dart';
import '../services/firebase_functions.dart';

part "reaction_store.g.dart";

class ReactionStore = _ReactionStore with _$ReactionStore;

abstract class _ReactionStore with Store {
  final FirebaseFunctions service = FirebaseFunctions();

  @observable
  bool isLoading = true;

  @observable
  bool isLiked = false;

  @observable
  ObservableList<String> likeList = ObservableList();

  @observable
  ObservableList<CommentModel> commentList = ObservableList();

  @action
  Future getLike(String postId) async {
    isLoading = true;

    final result = await service.getLikePost(postId: postId);

    likeList.clear();
    likeList.addAll(result);
    isLikedPost(postId);
    isLoading = false;

    return result;
  }

  @action
  Future getCommentsPost(String postId) async {
    isLoading = true;

    final result = await service.getPostComments(postId: postId);

    commentList.clear();
    commentList.addAll(result);

    isLoading = false;

    return result;
  }

  @action
  Future likePost(String postId) async {
    try {
      isLoading = true;
      isLiked = !isLiked;
      final result = await service.likePost(postId, likeList);
      await getLike(postId);
      isLoading = false;

      return result;
    } catch (e) {
      isLiked = !isLiked;
    }
  }

  @action
  Future addComment(String postId, String content) async {
    isLoading = true;

    final result =
        await service.createComment(comment: content, postId: postId);
    await getCommentsPost(postId);

    isLoading = false;

    return result;
  }

  @action
  void isLikedPost(String postId) {
    isLiked = service.isLiked(postId, likeList);
  }
}
