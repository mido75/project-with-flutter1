import 'package:flutter/material.dart';

class FavProductModel {
  String? name, image, price,id ,description;

  FavProductModel(
      {
        this.name,
        this.image,
        this.description,
        this.id,
        this.price});

  FavProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    price = map['price'];
    id = map['id'];

  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'id':id,
    };
  }
}