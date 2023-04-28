
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/categories_model.dart';
import '../service/home_service.dart';

class HomeViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel>? get categoryModel =>_categoryModel;

  List<CategoryModel>? _categoryModel=[];

HomeViewModel(){
  getCategory();
}

  getCategory() async{
  _loading.value=true;
    await  HomeService().getCategory().then((value){
      for(int i = 0; i < value.length;i++){
        _categoryModel!.add(CategoryModel.fromJson(value[i].data!() as Map<dynamic, dynamic>));
        print(_categoryModel!.length);
        _loading.value=false;

      }
      update();
    });

  }

}