import 'dart:convert';

import 'package:catapp/models/image.dart';
import 'package:catapp/models/wight.dart';

List<Breeds> breedsFromJson(String str) =>
    List<Breeds>.from(json.decode(str).map((x) => Breeds.fromJson(x)));


class Breeds {
  Breeds({
    this.name,
    this.temperament,
    this.origin,
    this.description,
    this.adaptability,
    this.childFriendly,
    this.dogFriendly,
    this.intelligence,
    required this.image,
  });

  final String? name;
  final String? temperament;
  final String? origin;
  final String? description;
  final int? adaptability;
  final int? childFriendly;
  final int? dogFriendly;
  final int? intelligence;
  final Image image;

  factory Breeds.fromJson(Map<String, dynamic> json) => Breeds(
      name: json["name"],
      temperament: json["temperament"],
      origin: json["origin"],
      description: json["description"],
      adaptability: json["adaptability"],
      childFriendly: json["child_friendly"],
      dogFriendly: json["dog_friendly"],
      intelligence: json["intelligence"],
      image: Image.fromJson(json["image"] ?? {}));

  Map<String, dynamic> toJson() => {
        "name": name,
        "origin": origin,
        "description": description,
        "adaptability": adaptability,
        "child_friendly": childFriendly,
        "intelligence": intelligence,
        "image": image,
      };
}
