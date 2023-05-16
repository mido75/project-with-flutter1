import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: TextStyle(
                    fontWeight:FontWeight.bold ,
                  )),
              SizedBox(height: 16.0.h),
              //Image(image: AssetImage(manShoes)),
              SizedBox(height: 16.0.h),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: 16.0.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text('11/Feb/2021 04:42 PM',
                    style: TextStyle(color: Colors.grey)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
