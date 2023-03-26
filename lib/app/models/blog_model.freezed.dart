// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlogsModel _$BlogsModelFromJson(Map<String, dynamic> json) {
  return _BlogsModel.fromJson(json);
}

/// @nodoc
mixin _$BlogsModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  set userId(String value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  List<Map> get images => throw _privateConstructorUsedError;
  set images(List<Map> value) => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  set time(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogsModelCopyWith<BlogsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogsModelCopyWith<$Res> {
  factory $BlogsModelCopyWith(
          BlogsModel value, $Res Function(BlogsModel) then) =
      _$BlogsModelCopyWithImpl<$Res, BlogsModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      List<Map> images,
      String time});
}

/// @nodoc
class _$BlogsModelCopyWithImpl<$Res, $Val extends BlogsModel>
    implements $BlogsModelCopyWith<$Res> {
  _$BlogsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? images = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Map>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BlogsModelCopyWith<$Res>
    implements $BlogsModelCopyWith<$Res> {
  factory _$$_BlogsModelCopyWith(
          _$_BlogsModel value, $Res Function(_$_BlogsModel) then) =
      __$$_BlogsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      List<Map> images,
      String time});
}

/// @nodoc
class __$$_BlogsModelCopyWithImpl<$Res>
    extends _$BlogsModelCopyWithImpl<$Res, _$_BlogsModel>
    implements _$$_BlogsModelCopyWith<$Res> {
  __$$_BlogsModelCopyWithImpl(
      _$_BlogsModel _value, $Res Function(_$_BlogsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? images = null,
    Object? time = null,
  }) {
    return _then(_$_BlogsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Map>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BlogsModel extends _BlogsModel {
  _$_BlogsModel(
      {required this.id,
      required this.userId,
      required this.title,
      this.description = "",
      this.images = const [],
      required this.time})
      : super._();

  factory _$_BlogsModel.fromJson(Map<String, dynamic> json) =>
      _$$_BlogsModelFromJson(json);

  @override
  String id;
  @override
  String userId;
  @override
  String title;
  @override
  @JsonKey()
  String description;
  @override
  @JsonKey()
  List<Map> images;
  @override
  String time;

  @override
  String toString() {
    return 'BlogsModel(id: $id, userId: $userId, title: $title, description: $description, images: $images, time: $time)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlogsModelCopyWith<_$_BlogsModel> get copyWith =>
      __$$_BlogsModelCopyWithImpl<_$_BlogsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BlogsModelToJson(
      this,
    );
  }
}

abstract class _BlogsModel extends BlogsModel {
  factory _BlogsModel(
      {required String id,
      required String userId,
      required String title,
      String description,
      List<Map> images,
      required String time}) = _$_BlogsModel;
  _BlogsModel._() : super._();

  factory _BlogsModel.fromJson(Map<String, dynamic> json) =
      _$_BlogsModel.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get userId;
  set userId(String value);
  @override
  String get title;
  set title(String value);
  @override
  String get description;
  set description(String value);
  @override
  List<Map> get images;
  set images(List<Map> value);
  @override
  String get time;
  set time(String value);
  @override
  @JsonKey(ignore: true)
  _$$_BlogsModelCopyWith<_$_BlogsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
