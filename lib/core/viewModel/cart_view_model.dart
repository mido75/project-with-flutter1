import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/core/service/database/cart_database_helper.dart';
import 'package:untitled/models/cart_product_model.dart';

class CartViewModel extends GetxController
{
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel =[];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  var dbHelper = CartDatabaseHelper.db;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  CartViewModel(){
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value=true;
    _cartProductModel = await dbHelper.getAllProduct();
    _loading.value=false;
    getTotalPrice();
    update();
  }

  addProduct(CartProductModel cartProductModel)async{
    for(int i = 0 ; i < _cartProductModel.length;i++)
    {
      if(_cartProductModel[i].id == cartProductModel.id){
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice += (double.parse(cartProductModel.price.toString()) * cartProductModel.quantity!.toInt());

    update();
  }

  deleteCartProduct(int index) async{
    await dbHelper.delete(cartProductModel[index]);
    _cartProductModel.removeAt(index);
    update();
  }

  removeAllProducts() async {
    await dbHelper.deleteAllProducts();
    getAllProduct();
  }

  getTotalPrice(){
    _totalPrice = 0;
    /*
    for(int i = 0 ; i < _cartProductModel.length;i++){
      _totalPrice += (double.parse(_cartProductModel[i].price.toString()) * _cartProductModel[i].quantity!.toInt());
      update();
    }

     */
    _cartProductModel.forEach((cartProduct) {
      _totalPrice += (double.parse(cartProduct.price.toString()) * cartProduct.quantity!.toInt());
    });
  }

  increaseQuantity(int index)async{

    _cartProductModel[index].quantity = _cartProductModel[index].quantity!.toInt() + 1;
    _totalPrice += (double.parse(_cartProductModel[index].price.toString()));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index)async{

    if(_cartProductModel[index].quantity!.toInt() > 0){
      _cartProductModel[index].quantity = _cartProductModel[index].quantity!.toInt() - 1;
      _totalPrice -= (double.parse(_cartProductModel[index].price.toString()));
      await dbHelper.updateProduct(_cartProductModel[index]);
      update();
    }
  }

}