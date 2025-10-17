


import 'package:json_annotation/json_annotation.dart';

part 'favorite_request_body.g.dart';

@JsonSerializable()
class FavoriteRequestBody {

   
  @JsonKey(name: 'image_id') 
  final String? imageId;

  FavoriteRequestBody({required this.imageId});

   Map<String, dynamic> toJson()=> _$FavoriteRequestBodyToJson(this);

}