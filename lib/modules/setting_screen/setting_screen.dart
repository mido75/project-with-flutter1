import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/who%20are%20you/Users.dart';

class SettingScreen extends StatelessWidget {
  FirebaseAuth _auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            child: Text('log out'),
            onPressed: (){
              _auth.signOut();
              Get.offAll(Users());
            },
          ),
        ],
      ),
    );
  }
}
