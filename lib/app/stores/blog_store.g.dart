// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BlogStore on _BlogStore, Store {
  Computed<bool>? _$hasResultsComputed;

  @override
  bool get hasResults => (_$hasResultsComputed ??=
          Computed<bool>(() => super.hasResults, name: '_BlogStore.hasResults'))
      .value;

  late final _$itemsAtom = Atom(name: '_BlogStore.items', context: context);

  @override
  ObservableList<BlogsModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<BlogsModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$fetchBlogFutureAtom =
      Atom(name: '_BlogStore.fetchBlogFuture', context: context);

  @override
  ObservableFuture<List<BlogsModel>> get fetchBlogFuture {
    _$fetchBlogFutureAtom.reportRead();
    return super.fetchBlogFuture;
  }

  @override
  set fetchBlogFuture(ObservableFuture<List<BlogsModel>> value) {
    _$fetchBlogFutureAtom.reportWrite(value, super.fetchBlogFuture, () {
      super.fetchBlogFuture = value;
    });
  }

  late final _$userAtom = Atom(name: '_BlogStore.user', context: context);

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$fetchBlogAsyncAction =
      AsyncAction('_BlogStore.fetchBlog', context: context);

  @override
  Future<dynamic> fetchBlog() {
    return _$fetchBlogAsyncAction.run(() => super.fetchBlog());
  }

  late final _$addBlogAsyncAction =
      AsyncAction('_BlogStore.addBlog', context: context);

  @override
  Future<dynamic> addBlog(BlogsModel model) {
    return _$addBlogAsyncAction.run(() => super.addBlog(model));
  }

  late final _$deleteBlogAsyncAction =
      AsyncAction('_BlogStore.deleteBlog', context: context);

  @override
  Future<dynamic> deleteBlog(String id) {
    return _$deleteBlogAsyncAction.run(() => super.deleteBlog(id));
  }

  late final _$editBlogAsyncAction =
      AsyncAction('_BlogStore.editBlog', context: context);

  @override
  Future<dynamic> editBlog(BlogsModel model) {
    return _$editBlogAsyncAction.run(() => super.editBlog(model));
  }

  late final _$_BlogStoreActionController =
      ActionController(name: '_BlogStore', context: context);

  @override
  void setUser(String text) {
    final _$actionInfo =
        _$_BlogStoreActionController.startAction(name: '_BlogStore.setUser');
    try {
      return super.setUser(text);
    } finally {
      _$_BlogStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
fetchBlogFuture: ${fetchBlogFuture},
user: ${user},
hasResults: ${hasResults}
    ''';
  }
}
