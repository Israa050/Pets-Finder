// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteResponseBody _$FavoriteResponseBodyFromJson(
  Map<String, dynamic> json,
) => FavoriteResponseBody(
  message: json['message'] as String?,
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$FavoriteResponseBodyToJson(
  FavoriteResponseBody instance,
) => <String, dynamic>{'message': instance.message, 'id': instance.id};
