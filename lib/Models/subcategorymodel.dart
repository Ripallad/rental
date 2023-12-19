// To parse this JSON data, do
//
//     final subcategorymodel = subcategorymodelFromMap(jsonString);

import 'dart:convert';

Subcategorymodel subcategorymodelFromMap(String str) =>
    Subcategorymodel.fromMap(json.decode(str));

String subcategorymodelToMap(Subcategorymodel data) =>
    json.encode(data.toMap());

class Subcategorymodel {
  int id;
  String category;
  String name;

  Subcategorymodel({
    required this.id,
    required this.category,
    required this.name,
  });

  factory Subcategorymodel.fromMap(Map<String, dynamic> json) =>
      Subcategorymodel(
        id: json["id"],
        category: json["category"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category": category,
        "name": name,
      };
}
