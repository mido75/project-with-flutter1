import 'package:get/get.dart';
import 'package:untitled/core/viewModel/auth.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
  }
}