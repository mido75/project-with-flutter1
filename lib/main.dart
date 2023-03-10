import 'package:flutter/material.dart';
import 'package:untitled/modules/forgotPass_screen/forgotPass_screen.dart';
import 'package:untitled/modules/register_screen/register_screen.dart';
import 'package:untitled/modules/who%20are%20you/Users.dart';

import 'modules/login_screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff0CC095),
      ),
      home: ForgotPassScreen(),
    );
  }
}
