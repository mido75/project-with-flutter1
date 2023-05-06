import 'package:flutter/material.dart';

class CartProductModel {
  String? name, image, price,id,user_id;
  int? quantity;

  CartProductModel(
      {
        this.name,
        this.image,
        this.quantity,
        this.id,
        this.user_id,
        this.price});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    id = map['id'];
    user_id = map['user_id'];

  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'id':id,
      'user_id':user_id
    };
  }
}