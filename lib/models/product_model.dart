import 'package:flutter/material.dart';

class ProductModel {
  String? name, image, description, sized, price,id,category,user_id;
  //Color color;

  ProductModel(
      {
         this.name,
         this.image,
         this.description,
        this.user_id,
         //required this.color,
        this.category,
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
    user_id = map['user_id'];
    price = map['price'];
    category = map['category'];

  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      //'color': color,
      'sized': sized,
      'id':id,
      'user_id':user_id,
      'price': price,
      'category':category,
    };
  }
}