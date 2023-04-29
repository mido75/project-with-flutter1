import 'package:flutter/material.dart';

class ProductModel {
  String? name, image, description, sized, price,id;
  //Color color;

  ProductModel(
      {
         this.name,
         this.image,
         this.description,
         //required this.color,
         this.sized,
        this.id,
         this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    //color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    id = map['id'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      //'color': color,
      'sized': sized,
      'id':id,
      'price': price,
    };
  }
}