import 'dart:io';
import 'dart:developer';

import 'package:bloc_app/app/util/const.dart';
import 'package:bloc_app/app/widgets/indicator.dart';
import 'package:bloc_app/app/models/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  var isLoading = false;

  Future uploadBlog(
      String title, String description, List<String>? images) async {
    try {
      String id = generateId();
      String ?userId =await getId();
      DateTime time = DateTime.now();

      Map<String, dynamic> blogDetails = {
        'id': id,
        'title': title,
        'description': description,
        'images': images,
        'time': time,
        "userId": userId
      };

      await _firebaseFirestore.collection('blogs').doc(id).set(blogDetails);

      return blogDetails;
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
      } on FirebaseException catch (e) {
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
      showAlert("$e");
      return BlogsModel(description: "", title: "", id: "", images: []);
    }
  }

  Future<void> deleteBlog(String id) async {
    try {
      await _firebaseFirestore.collection('blogs').doc(id).delete();
    } catch (e) {
      showAlert("$e");
    }
  }

  Future<void> editBlog(
      String id, String title, String description, List<String>? images) async {
    try {
      Map<String, dynamic> blogDetails = {
        'id': id,
        'title': title,
        'description': description,
        'images': images,
      };
      await _firebaseFirestore.collection('blogs').doc(id).update(blogDetails);
    } catch (e) {
      showAlert("$e");
    }
  }
}
