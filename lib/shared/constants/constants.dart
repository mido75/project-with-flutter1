

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/auth.dart';
import 'package:untitled/models/user_model.dart';

final String tableCartProduct ='cartProduct';
final String columnName ='name';
final String columnImage ='image';
final String columnQuantity ='quantity';
final String columnPrice ='price';
final String columnId ='id';
final String columnUserId = 'user_id';



const CACHED_USER_DATA = 'CACHED_USER_DATA';


int trader = 0;

final String tableFavProduct ='favProduct';
final String columnName_f ='name';
final String columnImage_f ='image';
final String columnDescription_f ='description';
final String columnPrice_f ='price';
final String columnId_f ='id';


const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  deliveryTime,
  addAddress,
  summary,
}


const Pname = 'name';

enum Delivery{
  StandardDerlivery,
  NextDayDelivery,
  NominatedDelivery,
}

