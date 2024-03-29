import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/auth.dart';
import 'package:untitled/core/viewModel/control_view_model.dart';
import 'package:untitled/core_trader/viewModel_trader/control_view_model_t.dart';
import 'package:untitled/modules/login_screen/login_screen.dart';
import 'package:untitled/modules/who%20are%20you/Users.dart';
import 'package:untitled/modules_trader/addProduct_screen/addProduct_screen.dart';
import 'package:untitled/modules_trader/home_screen_t/home_screen_t.dart';
import 'package:untitled/shared/constants/constants.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xff0CC095),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_travel,
              color: Color(0xff0CC095),
            ),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Color(0xff0CC095),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Color(0xff0CC095),
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
      ),
    );
  }

}
