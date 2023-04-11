import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled/core/viewModel/control_view_model.dart';
import 'package:untitled/helper/building.dart';
import 'package:untitled/layout/shop_layout.dart';
import 'package:untitled/modules/begin/begin_screen.dart';
import 'package:untitled/modules/control_view.dart';
import 'package:untitled/modules/forgotPass_screen/forgotPass_screen.dart';
import 'package:untitled/modules/home/home_screen.dart';
import 'package:untitled/modules/register_screen/register_screen.dart';
import 'package:untitled/modules/who%20are%20you/Users.dart';
import 'package:untitled/shared/styles/theme.dart';

import 'modules/login_screen/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: lighttheme,
      home: Scaffold(
        body: ControlView(),
      ),
    );
  }
}


