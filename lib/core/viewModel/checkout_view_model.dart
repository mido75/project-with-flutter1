import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:untitled/core/service/database/firestore_checkout.dart';
import 'package:untitled/core/viewModel/cart_view_model.dart';
import 'package:untitled/models/checkout_model.dart';
import 'package:untitled/modules/control_view.dart';
import 'package:untitled/modules/home/home_screen.dart';
import '../../shared/constants/constants.dart';
import '../../shared/styles/color.dart';

class CheckOutViewModel extends GetxController{
  //Get.lazyPut(() => CheckOutViewModel());
  CheckOutViewModel() {
    Get.lazyPut<CheckOutViewModel>(() => this);
    _getCheckoutsFromFireStore();
  }

  int get index =>_index ;
  int _index = 0;
  Pages get pages =>_pages;
  Pages _pages = Pages.deliveryTime;

  String? street1, street2 ,city ,state ,country , phone ,totalPrice;

  List<CheckoutModel> _checkouts = [];
  List<CheckoutModel> get checkouts => _checkouts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  GlobalKey<FormState> formState = GlobalKey();

  void channgeIndex(int i){
    if(i==0 || i<0 ){
      _pages = Pages.deliveryTime;
      _index =i ;

    }
    else if(i ==1){
      _pages = Pages.addAddress;
      _index = i;
    }else if(i== 2){
      formState.currentState?.save();
      if(formState.currentState!.validate()){
        _pages = Pages.summary;
        _index = i;
      }

    }else if(i==3){
      Get.to(ControlView());
      _pages = Pages.deliveryTime;
      _index=0;
      Get.find<CartViewModel>().removeAllProducts();
    }
    update();
  }

  Color getColor(int i ) {
    if (i == _index) {
      return defualtColor;
    } else if (i < _index) {
      return Colors.teal;
    } else {
      return defualtColor;
    }
  }


  _getCheckoutsFromFireStore() async {
    _isLoading = true;
    _checkouts = [];
    List<QueryDocumentSnapshot> _checkoutsSnapshot =
    await FirestoreCheckout().getOrdersFromFirestore();
    _checkoutsSnapshot.forEach((order) {
      _checkouts
          .add(CheckoutModel.fromJson(order.data() as Map<String, dynamic>));
    });
    _isLoading = false;
    update();
  }

  addCheckoutToFireStore() async {
    print(street2);
    print('fffffffffffffffff');
    await FirestoreCheckout().addOrderToFirestore(CheckoutModel(
      street1: street1!,
      street2: street2!,
      city: city!,
      state: state!,
      country: country!,
      phone: phone!,
      totalPrice: Get.find<CartViewModel>().totalPrice.toString(),
      date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
    ),Get.find<CartViewModel>().cartProductModel!.toList());
    await FirestoreCheckout().addAllOrderToFirestore(CheckoutModel(
      street1: street1!,
      street2: street2!,
      city: city!,
      state: state!,
      country: country!,
      phone: phone!,
      totalPrice: Get.find<CartViewModel>().totalPrice.toString(),
      date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
    ),Get.find<CartViewModel>().cartProductModel!.toList());
    totalPrice = Get.find<CartViewModel>().totalPrice.toString();
    //Get.find<CartViewModel>().removeAllProducts();
   // Get.back();
    _getCheckoutsFromFireStore();
  }


}