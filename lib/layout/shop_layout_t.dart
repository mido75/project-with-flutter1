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

class ShopLayout_T extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel_T>(
      init: ControlViewModel_T(),
      builder: (controller) => Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: bottomNavigationBar_T(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(Icons.add,),
            onPressed: () {
              Get.to(addProductScreen());
            }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget bottomNavigationBar_T() {
    return GetBuilder<ControlViewModel_T>(
      init: ControlViewModel_T(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xff0CC095),
            ),
            label: 'Home',
          ),

          /*
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outlined,
              color: Colors.red,
              size: 40,
            ),
            label: 'add',
          ),

           */
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
