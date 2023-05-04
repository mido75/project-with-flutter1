import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/auth.dart';
import 'package:untitled/modules/control_view.dart';
import 'package:untitled/modules/who%20are%20you/Users.dart';


class BeginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("imagies/269969424_655870578924985_1432197706298581466_nn.png"),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
  void goToNextView(){
    Future.delayed(Duration(seconds: 3),(){
      Get.to(()=>ControlView(),transition: Transition.fade);
    });
  }
}
