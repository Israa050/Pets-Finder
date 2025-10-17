


import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class PetImage {
  String? id;
  String? url;
  int? width;
  int? height;

  PetImage({this.id, this.url, this.width, this.height});

  factory PetImage.fromJson(Map<String, dynamic> json) => _$PetImageFromJson(json);
}