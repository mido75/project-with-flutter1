import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/notifications_screen/notifications_screen.dart';
import 'package:untitled/shared/styles/color.dart';

class HomeScreen_T extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "imagies/269969424_655870578924985_1432197706298581466_nn.png"),
                  fit: BoxFit.fill),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(NotificationsScreen());
              },
              icon: Icon(
                Icons.notifications,
                color: defualtColor,
              )),
        ],
      ),
    );
  }
}
