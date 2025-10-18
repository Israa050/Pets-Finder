


import 'package:json_annotation/json_annotation.dart';
import 'package:pets_finder_app/features/home/data/models/image.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet {
  String? id;
  String? url;
  List<Breeds>? breeds;
  int? width;
  int? height;

  Pet({this.id, this.url, this.breeds, this.width, this.height});

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}


@JsonSerializable()
class Breeds {
  Weight? weight;
  String? id;
  String? name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? description;
  String? lifeSpan;
  int? indoor;
  int? lap;
  String? altNames;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? strangerFriendly;
  int? vocalisation;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;
  int? suppressedTail;
  int? shortLegs;
  String? wikipediaUrl;
  int? hypoallergenic;
  String? referenceImageId;
  PetImage? image;
  bool isFavorite;
  int favoriteId;


  Breeds(
      {this.weight,
      this.isFavorite = false,
      this.favoriteId = -1,
      this.id,
      this.name,
      this.cfaUrl,
      this.vetstreetUrl,
      this.vcahospitalsUrl,
      this.temperament,
      this.origin,
      this.countryCodes,
      this.countryCode,
      this.description,
      this.lifeSpan,
      this.indoor,
      this.lap,
      this.altNames,
      this.adaptability,
      this.affectionLevel,
      this.childFriendly,
      this.dogFriendly,
      this.energyLevel,
      this.grooming,
      this.healthIssues,
      this.intelligence,
      this.sheddingLevel,
      this.socialNeeds,
      this.strangerFriendly,
      this.vocalisation,
      this.experimental,
      this.hairless,
      this.natural,
      this.rare,
      this.rex,
      this.suppressedTail,
      this.shortLegs,
      this.wikipediaUrl,
      this.hypoallergenic,
      this.referenceImageId,this.image});

  factory Breeds.fromJson(Map<String, dynamic> json) => _$BreedsFromJson(json);
}



@JsonSerializable()
class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);
}