import 'package:flutter/material.dart';
import 'defaultAppBar.dart';
import 'notificationTiles.dart';
import 'notificationPage.dart';
import 'defaultBackButton.dart';


class NotificationList extends StatefulWidget {
  NotificationList({ Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
        title: 'Notifications',
        child: DefaultBackButton(),
      ),
      body: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 1,
          itemBuilder: (context, index) {
            return NotificationTiles(
              title: 'HandMade',
              subtitle: 'Thanks for download HandMade app.',
              enable: true,
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage())),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}
