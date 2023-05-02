
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/core/service/firestore_user.dart';
import 'package:untitled/helper/local_storage_data.dart';
import 'package:untitled/models/user_model.dart';

class SettingModel extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
    getCurrentDataUser();
  }

  String? name, email, password, picUrl,phone , coverUrl;

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  bool _loading = false;
  bool get loading => _loading;


  final LocalStorageData localStorageData =  Get.find();

  UserModel? get userModel => _userModel;
   UserModel? _userModel;

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



  void getCurrentDataUser() async
  {
    _loading = true;
    _currentUser = await LocalStorageData.getUserData();
    _loading = false;
    print(_currentUser);
    update();
  }
  updateCurrentUser() async
  {
    try {
      UserModel _userModel = UserModel(
          userId: _currentUser!.userId,
          email: email,
          name: name,
          pic: picUrl == null ? _currentUser!.pic : picUrl,
          cover: coverUrl == null ? _currentUser!.cover : coverUrl,
          phone: phone,
      );
      await FirebaseAuth.instance.currentUser!.updateEmail(email!);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name!);
      //await FirebaseAuth.instance.currentUser!.updatePhoneNumber(phone!);
      FireStoreUser().addUserToFireStore(_userModel);
      await LocalStorageData.setUserData(_userModel);
      getCurrentDataUser();
      Get.back();
    } catch (error) {
      print(error.toString());
      String errorMessage =
      error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to update..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}


