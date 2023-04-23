
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/helper/local_storage_data.dart';
import 'package:untitled/models/user_model.dart';

class SettingModel extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData =  Get.find();

  UserModel get userModel => _userModel;
  late UserModel _userModel;

  Future<void>signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void getCurrentUser() async
  {
    await localStorageData.getUser.then((value){
      _userModel = value!;
    });
    update();
  }
}


