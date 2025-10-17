
import 'package:json_annotation/json_annotation.dart';
import 'package:pets_finder_app/features/home/data/models/image.dart';


part 'favorites.g.dart';

@JsonSerializable()
class Favorite {
  int? id;
  String? userId;
  String? imageId;
  String? subId;
  String? createdAt;
  PetImage? image;

  Favorite(
      {this.id,
      this.userId,
      this.imageId,
      this.subId,
      this.createdAt,
      this.image});

  factory Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);
}

