// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlogsModel _$$_BlogsModelFromJson(Map<String, dynamic> json) =>
    _$_BlogsModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? "",
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      time: json['time'] as String,
    );

Map<String, dynamic> _$$_BlogsModelToJson(_$_BlogsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'time': instance.time,
    };
