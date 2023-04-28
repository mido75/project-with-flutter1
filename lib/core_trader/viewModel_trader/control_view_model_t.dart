import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/cart_screen/cart.dart';
import 'package:untitled/modules/cateogries_screen/cateogries_screen.dart';
import 'package:untitled/modules/home/home_screen.dart';
import 'package:untitled/modules/setting_screen/setting_screen.dart';
import 'package:untitled/modules_trader/addProduct_screen/addProduct_screen.dart';
import 'package:untitled/modules_trader/home_screen_t/home_screen_t.dart';
import 'package:untitled/modules_trader/setting_screen_t/setting_screen_t.dart';

import '../../modules/favourites/favorites_screen.dart';

class ControlViewModel_T extends GetxController {

  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget _currentScreen = HomeScreen_T();

  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeScreen_T();
          break;
        }
      case 1:
        {
          _currentScreen = SettingScreen_T();
          break;
        }
    }
    update();
  }
}