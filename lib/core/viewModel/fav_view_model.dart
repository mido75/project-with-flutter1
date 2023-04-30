import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/service/database/fav_database_helper.dart';
import 'package:untitled/models/fav_product_model.dart';

class FavViewModel extends GetxController
{
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<FavProductModel> _favProductModel =[];
  List<FavProductModel> get favProductModel => _favProductModel;

  var dbHelper = FavDatabaseHelper.db;


  FavViewModel(){
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value=true;
    _favProductModel = await dbHelper.getAllProduct();
    _loading.value=false;
    update();
  }

  addFavProduct(FavProductModel favProductModel)async{
    print(_favProductModel.length);
    for(int i = 0 ; i < _favProductModel.length;i++)
    {
      if(_favProductModel[i].id == favProductModel.id){
        return;
      }
    }
    await dbHelper.insert(favProductModel);
    _favProductModel.add(favProductModel);

    update();
  }

  deleteFavProduct(int index) async{
    await dbHelper.delete(favProductModel[index]);
    _favProductModel.removeAt(index);
    update();
  }


}