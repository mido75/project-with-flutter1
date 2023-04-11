import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/card/card.dart';
import 'package:untitled/modules/cateogries_screen/cateogries_screen.dart';
import 'package:untitled/modules/favorite_screen/favorites_screen.dart';
import 'package:untitled/modules/home/home_screen.dart';
import 'package:untitled/modules/setting_screen/setting_screen.dart';

class ControlViewModel extends GetxController {

  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget _currentScreen = HomeScreen();

  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          _currentScreen =  CateogriesScreen();
          break;
        }
      case 2:
        {
          _currentScreen = CardScreen();
          break;
        }
      case 3:
        {
          _currentScreen = FavoriteScreen();
          break;
        }
      case 4:
        {
          _currentScreen = SettingScreen();
          break;
        }
    }
    update();
  }
}