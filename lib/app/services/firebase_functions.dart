import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../models/blog_model.dart';
import '../models/comment_model.dart';
import '../util/const.dart';
import '../util/paths.dart';
import '../widgets/indicator.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false;
  Future uploadBlog(BlogsModel blog) async {
    try {
      await _firebaseFirestore
          .collection('blogs')
          .doc(blog.id)
          .set(blog.toJson());

      return blog;
    } catch (e) {
      showAlert("$e");
    }
  }

  Future<void> uploadImage(
    File file, {
    required Function(int mount, int total) onSendProgress,
    required Function(String url) onFinish,
  }) async {
    if (await file.exists()) {
      try {
        String imageName = generateId();

        UploadTask uploadTask =
            _storage.ref().child("images").child(imageName).putFile(file);

        uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
          switch (taskSnapshot.state) {
            case TaskState.running:
              print(
                  "process ${taskSnapshot.bytesTransferred} ${taskSnapshot.totalBytes}");
              onSendProgress.call(
                  taskSnapshot.bytesTransferred, taskSnapshot.totalBytes);

              break;

            case TaskState.success:
              onFinish.call(await taskSnapshot.ref.getDownloadURL());
              break;
            case TaskState.paused:
              break;
            case TaskState.canceled:
              break;
            case TaskState.error:
              break;
          }
        });
      } on FirebaseException {
        rethrow;
      }
    }
  }

  Future<List<BlogsModel>> getBlogs() async {
    if (!isLoading) {
      try {
        return await _firebaseFirestore
            .collection('blogs')
            .orderBy('time')
            .get()
            .catchError((error, stackTrace) {
          log("error $error");
          print(stackTrace);
        }).then((value) {
          Indicator.closeLoading();
          return value.docs.map((e) => BlogsModel.fromJson(e.data())).toList();
        });
      } catch (e) {
        showAlert("$e");
        print(e.toString());
        return [];
      }
    } else {
      return [];
    }
  }

  Future<BlogsModel> getBlogsById(String id) async {
    try {
      var documentSnapshot =
          await _firebaseFirestore.collection('blogs').doc(id).get();

      return BlogsModel.fromJson(documentSnapshot.data()!);
    } catch (e) {
      debugPrint('e $e');
      rethrow;
    }
  }

  Future<void> deleteBlog(String id) async {
    try {
      await _firebaseFirestore.collection('blogs').doc(id).delete();
    } catch (e) {
      showAlert("$e");
    }
  }

  Future<void> editBlog(BlogsModel blog) async {
    try {
      await _firebaseFirestore
          .collection('blogs')
          .doc(blog.id)
          .update(blog.toJson());
    } catch (e) {
      showAlert("$e");
    }
  }

  Future<void> likePost(String postId, List<String> likes) async {
    var userId = auth.currentUser!.uid;

    log("likes $likes userId $userId");
    if (likes.contains(userId)) {
      var result = await _firebaseFirestore
          .collection(Paths.likes)
          .doc(postId)
          .collection(Paths.postLikes)
          .doc(userId)
          .delete();
    } else {
      var result = await _firebaseFirestore
          .collection(Paths.likes)
          .doc(postId)
          .collection(Paths.postLikes)
          .doc(userId)
          .set({});
    }
  }

  bool isLiked(String postId, List<String> likes) {
    var userId = auth.currentUser!.uid;
    log("isLiked ${likes.contains(userId)}");
    return likes.contains(userId);
  }

  Future<List<CommentModel>> getPostComments({required String postId}) async {
    var result = await _firebaseFirestore
        .collection(Paths.comments)
        .doc(postId)
        .collection(Paths.postComments)
        .orderBy('date', descending: false)
        .get();

    List<CommentModel> temp = [];
    result.docs.map((doc) async {
      temp.add(CommentModel.fromDocument(doc));
    }).toList();
    log("Comment $temp");
    return temp;
  }

  Future<List<String>> getLikePost({required String postId}) async {
    var result = await _firebaseFirestore
        .collection(Paths.likes)
        .doc(postId)
        .collection(Paths.postLikes)
        .get();

    return result.docs.map((element) {
      return element.id;
    }).toList();
  }

  @override
  Future<void> createComment({
    required String postId,
    required String comment,
  }) async {
    var userId = auth.currentUser!.uid;
    await _firebaseFirestore
        .collection(Paths.comments)
        .doc(postId)
        .collection(Paths.postComments)
        .add({
      'postId': postId,
      'author': FirebaseFirestore.instance.collection(Paths.users).doc(userId),
      'content': comment,
      'date': DateTime.now().toIso8601String(),
    });
  }

  Future<void> followUser(
      {required String followUserId, String status = "pending"}) async {
    var userId = auth.currentUser!.uid;
    log("Start Following $userId  $followUserId");
    // Add followUser to user's userFollowing.
    await _firebaseFirestore
        .collection(Paths.following)
        .doc(userId)
        .collection(Paths.userFollowing)
        .doc(followUserId)
        .set({"status": status});

    await _firebaseFirestore
        .collection(Paths.followers)
        .doc(followUserId)
        .collection(Paths.userFollowers)
        .doc(userId)
        .set({});
  }

  Future<void> unfollowUser({
    required String unfollowUserId,
  }) async {
    var userId = auth.currentUser!.uid;

    log("unfollow $userId $unfollowUserId");

    // Remove unfollowUser from user's userFollowing.
    await _firebaseFirestore
        .collection(Paths.following)
        .doc(userId)
        .collection(Paths.userFollowing)
        .doc(unfollowUserId)
        .delete();

    await _firebaseFirestore
        .collection(Paths.followers)
        .doc(unfollowUserId)
        .collection(Paths.userFollowers)
        .doc(userId)
        .delete();
  }

  Future<void> removeFollowUser({required String removeFollowUser}) async {
    var userId = auth.currentUser!.uid;

    // Remove unfollowUser from user's userFollowing.
    await _firebaseFirestore
        .collection(Paths.followers)
        .doc(userId)
        .collection(Paths.userFollowers)
        .doc(removeFollowUser)
        .delete();

    await _firebaseFirestore
        .collection(Paths.followers)
        .doc(removeFollowUser)
        .collection(Paths.userFollowers)
        .doc(userId)
        .delete();

    // Remove unfollowUser from user's userFollowing.
    await _firebaseFirestore
        .collection(Paths.following)
        .doc(removeFollowUser)
        .collection(Paths.userFollowing)
        .doc(userId)
        .delete();

    // Remove unfollowUser from user's userFollowing.
    await _firebaseFirestore
        .collection(Paths.following)
        .doc(userId)
        .collection(Paths.userFollowing)
        .doc(removeFollowUser)
        .delete();
  }

  Future<void> acceptOrRejectRequest(
      {required String followUserId, required bool status}) async {
    var userId = auth.currentUser!.uid;
    if (status) {
      await _firebaseFirestore
          .collection(Paths.following)
          .doc(followUserId)
          .collection(Paths.userFollowing)
          .doc(userId)
          .set({"status": "accept"});
    } else {
      await _firebaseFirestore
          .collection(Paths.following)
          .doc(followUserId)
          .collection(Paths.userFollowing)
          .doc(userId)
          .delete();
    }
  }

  Future<Map?> isFollowing({
    required String otherUserId,
  }) async {
    var userId = auth.currentUser!.uid;

    log("userId $userId otherUserId $otherUserId");

    // is otherUser in user's userFollowing
    final otherUserDoc = await _firebaseFirestore
        .collection(Paths.following)
        .doc(userId)
        .collection(Paths.userFollowing)
        .doc(otherUserId)
        .get();

    // is otherUser in user's userFollowing
    final followState = await _firebaseFirestore
        .collection(Paths.following)
        .doc(otherUserId)
        .collection(Paths.userFollowing)
        .doc(userId)
        .get();

    // is otherUser in user's userFollowing
    final userFollowers = await _firebaseFirestore
        .collection(Paths.followers)
        .doc(userId)
        .collection(Paths.userFollowers)
        .doc(otherUserId)
        .get();

    return {
      "following": otherUserDoc.data(),
      "follower": userFollowers.exists,
      "isFollowed": followState.data()
    };
  }

  Future<List> followerList(String otherUserId) async {
    final userDoc = await _firebaseFirestore
        .collection(Paths.followers)
        .doc(otherUserId)
        .collection(Paths.userFollowers)
        .get();

    return userDoc.docs;
  }

  Future<List> followingList(String otherUserId) async {
    final userDoc = await _firebaseFirestore
        .collection(Paths.following)
        .doc(otherUserId)
        .collection(Paths.userFollowing)
        .get();

    return userDoc.docs;
  }
}
