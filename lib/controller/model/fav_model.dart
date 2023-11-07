// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'dart:convert';

FavoriteModel favoriteModelFromJson(String str) =>
    FavoriteModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());

class FavoriteModel {
  final List<Datum>? data;

  FavoriteModel({
    this.data,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final int? productId;

  Datum({
    this.id,
    this.productId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
      };
}
