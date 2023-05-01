
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/models/product_model.dart';

import '../../models/categories_model.dart';
import '../service/home_service.dart';

class HomeViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel>? get categoryModel =>_categoryModel;
  List<CategoryModel>? _categoryModel=[];

  List<ProductModel>? get productModel =>_productModel;
  List<ProductModel>? _productModel=[];

HomeViewModel(){
  getCategory();
  getSellingProduct();
}

  getCategory() async{
  _loading.value=true;
    await  HomeService().getCategory().then((value){
      for(int i = 0; i <value.length;i++){
        _categoryModel!.add(CategoryModel.fromJson(value[i].data!() as Map<dynamic, dynamic>));
        print(_categoryModel!.length);
        _loading.value=false;

      }
      update();
    });

  }

  getSellingProduct() async{
    _loading.value=true;
    await  HomeService().getBestSelling().then((value) {
      for(int i = 0; i < value.length;i++){
        _productModel!.add(ProductModel.fromJson(value[i].data!() as Map<dynamic, dynamic>));
        _loading.value=false;
      }
      print(productModel!.length);
      update();
    });
  }

}