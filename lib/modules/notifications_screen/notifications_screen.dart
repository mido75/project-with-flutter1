import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Notifications',
                      style: TextStyle(fontSize: 20,),
                    ),
                  ),
                  Container(
                    width: 24,
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child:Container(
                alignment: Alignment.center,
                child: Text(
                  'You don\'t have notifications right now.',
                  style: TextStyle(fontSize: 16,color: Colors.black54,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
