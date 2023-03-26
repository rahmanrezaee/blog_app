import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@unfreezed
class CommentModel with _$CommentModel {
  factory CommentModel({
    required String id,
    required String postId,
    required String author,
    @Default("") String content,
    required String date,
  }) = _CommentModel;

  CommentModel._();

  factory CommentModel.fromJson(Map<String, Object?> json) =>
      _$CommentModelFromJson(json);

  static CommentModel fromDocument(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    final authorRef = data['author'] as DocumentReference;
    // final authorDoc = await authorRef.get();

    return CommentModel(
      id: doc.id,
      postId: data['postId'] ?? '',
      author: "User Defined",
      content: data['content'] ?? '',
      date: data['date'],
    );
  }
}
