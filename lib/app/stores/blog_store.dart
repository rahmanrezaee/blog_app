import 'dart:developer';

import 'package:bloc_app/app/models/blog_model.dart';
import 'package:bloc_app/app/services/firebase_functions.dart';
import 'package:mobx/mobx.dart';

part 'blog_store.g.dart';

class BlogStore = _BlogStore with _$BlogStore;

abstract class _BlogStore with Store {
  final FirebaseFunctions service = FirebaseFunctions();
  // No need to observe this as we are relying on the fetchBlogFuture.status
  @observable
  ObservableList<BlogsModel> items = ObservableList();

  // We are starting with an empty future to avoid a null check
  @observable
  ObservableFuture<List<BlogsModel>> fetchBlogFuture = emptyResponse;

  @observable
  String user = '';

  @computed
  bool get hasResults =>
      fetchBlogFuture != emptyResponse &&
      fetchBlogFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<List<BlogsModel>> emptyResponse =
      ObservableFuture.value([]);

  @action
  Future fetchBlog() async {
    items.clear();
    final future = service.getBlogs();
    fetchBlogFuture = ObservableFuture(future);
    items.addAll(await future);
    return true;
  }

  @action
  Future addBlog(BlogsModel model) async {
    var result =
        await service.uploadBlog(model.title, model.description, model.images);

    log("result $result");
    items.add(BlogsModel.fromJson(result));
  }
  @action
  Future deleteBlog(String id) async {
    await service.deleteBlog(id);

    items.removeWhere((element) => element.id == id);
  }
  @action
  Future editBlog(BlogsModel model) async {
    await service.editBlog(
        model.id, model.title, model.description, model.images);
    int i = items.indexWhere((element) => element.id == model.id);
    items[i] = model;
  }

  @action
  void setUser(String text) {
    fetchBlogFuture = emptyResponse;
    user = text;
  }
}
