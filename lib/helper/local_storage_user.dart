


import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/shared/constants/constants.dart';

class LocalStorageUser {

  static setUserData(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  static Future<UserModel> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserModel.fromJson(json.decode(prefs.getString(CACHED_USER_DATA)!) as Map<dynamic, dynamic>);
  }

  static clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
