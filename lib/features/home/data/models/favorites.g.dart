// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favorite _$FavoriteFromJson(Map<String, dynamic> json) => Favorite(
  id: (json['id'] as num?)?.toInt(),
  userId: json['userId'] as String?,
  imageId: json['imageId'] as String?,
  subId: json['subId'] as String?,
  createdAt: json['createdAt'] as String?,
  image: json['image'] == null
      ? null
      : PetImage.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FavoriteToJson(Favorite instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'imageId': instance.imageId,
  'subId': instance.subId,
  'createdAt': instance.createdAt,
  'image': instance.image,
};
