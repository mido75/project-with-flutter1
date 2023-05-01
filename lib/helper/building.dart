import 'package:get/get.dart';
import 'package:untitled/core/viewModel/auth.dart';
import 'package:untitled/core/viewModel/cart_view_model.dart';
import 'package:untitled/core/viewModel/control_view_model.dart';
import 'package:untitled/core/viewModel/home_view_model.dart';
import 'package:untitled/helper/local_storage_data.dart';
import 'package:untitled/models/setting_model.dart';

import '../core/viewModel/checkout_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => SettingModel());
    Get.lazyPut(() => CheckOutViewModel());

  }
}