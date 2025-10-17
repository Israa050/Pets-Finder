


import 'package:json_annotation/json_annotation.dart';

part 'favorite_response_body.g.dart';

@JsonSerializable()
class FavoriteResponseBody {

  final String? message;
  final int? id;

  FavoriteResponseBody({required this.message, required this.id});

  factory FavoriteResponseBody.fromJson(Map<String,dynamic> json) => _$FavoriteResponseBodyFromJson(json);

}