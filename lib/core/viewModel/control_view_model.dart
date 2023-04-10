import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/auth.dart';
import 'package:untitled/modules/home/home_screen.dart';
import 'package:untitled/modules/login_screen/login_screen.dart';
import 'package:untitled/modules/who%20are%20you/Users.dart';


class controlViewModel extends GetxController {



  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = HomeScreen();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          currentScreen = HomeScreen();

          // currentScreen = CartView();
          break;
        }
      case 2:
        {
          currentScreen = HomeScreen();

          // currentScreen = ProfileView();
          break;
        }
    }
    update();
  }

}

/*
class controlViewModel extends GetWidget<AuthViewModel>{
  @override
  Widget build(BuildContext context){
    return Obx((){
      return (Get.find<AuthViewModel>().user != null)
          ? HomeScreen()
          : Users();
    });
  }
}

 */