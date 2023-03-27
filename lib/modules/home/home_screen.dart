import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/login_screen/login_screen.dart';

class HomeScreen extends StatelessWidget {

  FirebaseAuth _auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MaterialButton(
        child: Text('logout',),
        onPressed: (){
          _auth.signOut();
          Get.offAll(LoginScreen());
        },
      ),
    );
  }
}
