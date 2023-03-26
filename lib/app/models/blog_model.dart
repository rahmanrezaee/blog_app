
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_model.freezed.dart';
part 'blog_model.g.dart';

@unfreezed
class BlogsModel with _$BlogsModel {
  factory BlogsModel({
    required String id,
    required String userId,
    required String title,
    @Default("") String description,
    @Default([]) List<Map> images,
    required String time,
  }) = _BlogsModel;

  BlogsModel._();

  factory BlogsModel.fromJson(Map<String, Object?> json) =>
      _$BlogsModelFromJson(json);
}
