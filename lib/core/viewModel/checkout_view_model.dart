import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:untitled/modules/control_view.dart';
import '../../shared/constants/constants.dart';
import '../../shared/styles/color.dart';

class CheckOutViewModel extends GetxController{
  //Get.lazyPut(() => CheckOutViewModel());
  CheckOutViewModel() {
    Get.lazyPut<CheckOutViewModel>(() => this);
  }

  int get index =>_index ;
  int _index = 0;
  Pages get pages =>_pages;
  Pages _pages = Pages.deliveryTime;

  String? street1, street2 ,city ,state ,country;
  GlobalKey<FormState> formState =GlobalKey();

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


}