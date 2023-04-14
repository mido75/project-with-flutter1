import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/control_view_model.dart';
import 'package:untitled/modules/cart_screen/cart.dart';
import 'package:untitled/modules/cateogries_screen/cateogries_screen.dart';
import 'package:untitled/modules/home/home_screen.dart';
import 'package:untitled/modules/setting_screen/setting_screen.dart';
import '../core/viewModel/home_view_model.dart';
/*
class ShopLayout extends StatelessWidget {

  var controller = Get.put(HomeViewModel());

  List<Widget> bottomScreens=
  [
    HomeScreen(),
    CateogriesScreen(),
    CardScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>bottomScreens.elementAt(controller.currentNavIndex.value)),
      bottomNavigationBar:  Obx(()=>BottomNavigationBar(
        currentIndex: controller.currentNavIndex.value,
        onTap: (index){
          controller.currentNavIndex.value = index;
        },
        items:
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Color(0xff0CC095),),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps,color: Color(0xff0CC095),),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel,color: Color(0xff0CC095),),
            label: 'card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,color: Color(0xff0CC095),),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Color(0xff0CC095),),
            label: 'Settings',
          ),
        ],
      ),),
    ) ;
  }
}


 */