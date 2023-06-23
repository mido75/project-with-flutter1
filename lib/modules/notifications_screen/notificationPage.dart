import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'dart:core';
import 'defaultAppBar.dart';
import 'defaultBackButton.dart';class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
        title: 'Notification',
        child: DefaultBackButton(),
      ),
      body: FittedBox(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(20.0).w,
          padding: EdgeInsets.all(20.0).w,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0).w,
              boxShadow: [BoxShadow(color:Colors.white , blurRadius: 2.0.r)]),
          child: Column(
            children: [
              Text(
                'HandMade App is for helping small businesses to expand and reach out to more customers. This app was designed especially for handmade and home-made products' ,
                  style: TextStyle(
                    fontWeight:FontWeight.bold ,
                  )),
              SizedBox(height: 16.0.h),
              //Image(image: AssetImage(manShoes)),
              SizedBox(height: 16.0.h),
              Text(
                  ".",
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: 16.0.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text('${DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now())}',
                    style: TextStyle(color: Colors.grey)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
