import 'package:flutter/material.dart';
import 'defaultAppBar.dart';
import 'notificationTiles.dart';
import 'notificationPage.dart';
import 'defaultBackButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'defaultAppBar.dart';
import 'notificationTiles.dart';
import 'notificationPage.dart';
import 'defaultBackButton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'defaultAppBar.dart';
import 'notificationTiles.dart';
import 'notificationPage.dart';
import 'defaultBackButton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NotificationList extends StatefulWidget {
  NotificationList({ Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  List<String> _notifications = [];
  void initState() {
    super.initState();

    // Listen for changes to the "products" node in the database
    _database.child("products").onChildAdded.listen((event) {
      // When a new child is added to the "products" node, send a notification
      final product = event.snapshot.value as Map<dynamic, dynamic>;
      final productName = product["name"] as String;
      _sendNotification("New Product Added", "Product Name: $productName");
    });

    // Configure Firebase Messaging to handle incoming notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // When a notification is received while the app is in the foreground, show an alert dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message.notification?.title ?? ""),
            content: Text(message.notification?.body ?? ""),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    });

    // Request permission to send notifications
    _messaging.requestPermission();
  }

  Future<void> _sendNotification(String title, String body) async {
    // Get the FCM token for this device
    final token = await _messaging.getToken();

    // Prepare the notification payload
    final payload = <String, dynamic>{
      "notification": {
        "title": title,
        "body": body,
      },
      "to": token,
    };

    // Send the notification to Firebase Cloud Messaging
    await http.post(
      Uri.parse("https://fcm.googleapis.com/fcm/send"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "key=-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDK66xM54tWyQzY\nDvqzWI2AgfZHkLBwJ2iUnOVtKDkN8oCilKJq0E/+mThIfMyN6+7dVStiQSO6KBwl\nE1gCEdDMIMdcndBxeDI7eMuSQS1iX03m8JgQhFJf9MDajtWXRxqcqxWqUC5VImA7\nLcI5d7MmLSm1GYmRQKr/GA35AP38LMWZmGvTduHyklmhRL+VVANWaV22SfUbNt76\nCiKuPud5PQotKwnEpLHDhNr0vW+2K9lJQx4spqQWd+qFl59Ucj2qpPgu99G6NugC\n7JV2UM+MCL+dsjeTSkfLm0xhYUdtYgAlOX8aT7K1mxFyUnsl2T3p1x5q/q0CrR0F\nfJIdEGU5AgMBAAECggEAQDUcOuVVGKvbLY5n01HkzFHTHMfynDpMBCI1EjoU+43N\nGCSR09yAQ142CfG7Q/jwhwZJCPj1lhTU+wJI6ba7a6u/iVXCO/U9Z8YMHAYVlzfy\nzW05oJhN/GDUmRNzEEAGcqZL360pS/TpoDAVcdunSyAlP1GKTvS4Zqk02qJuu1ja\nZ4xOK7B4LQ/GqWmPuqZFl1+lEbAPQOGqsz+l63lMAa9sxAc+qd/Hs/0IREYzH6GL\n3PKzh4i7sk9PQ4xIrPAvujaWxyIWie34HK1IZO2TGANsj5Ykd1Nob5skB6rVp6bQ\nYqGIJe1XktVrvwp2fKVXujJZ7zPEM52mZ3cAPtsiJQKBgQD7o5db3xIBAKFXONNJ\nnk9WfYRGyweynqAT079taVz1FlyB2mZrgFhsTreW9kzBoez6rGXt6Ly8bX4AcVz5\noyB7tvmhloS8CQpp9H1LRO506xM4GPEYY/3UP3Ux1z72sKq23Lq1eO8PvCluRdiJ\n4k5eJWTv8kja8vIw7QJY++U3AwKBgQDOb/Cr6QEFXm49yRcRf34/IOadZveiaKDG\nBwR2ZODd6xZgTqtaBY4DnEW2o4/uznNXqZwJonYhP9VEX2qORXMhaVONb5B1Llvo\ny917LPPj0yKuO408Gn+sjo+1QCOoMjLGD9HsEUeVDy8EI3+2orzOK0FBn8+RQePb\nuYBvslRwEwKBgD7DTMszVjA90gAJQlnITI2L/OQTW7YnblHDrKlDcFYI38XbjVQe\nzO8mqw/SGs7o7kyPl1TBieGNhbHilIgHMeDpgFXXTv//WUOYIXAWn0s2HrMNNYUZ\n24OG2Fo4D5JD+jBl2YPNyAKqscK5VQr/EQDWXtiiG53QnqupUb6UBVW1AoGAN62h\nb/xsNhJ+EVQHUMTePBCXoqR+7eLiWgbSgUw8Ch657kfJl4IgB4FCnDwJOhOcsGwi\nlcanrdgVoVdK2gyJPN23l1Ib2D8ksukpV2uMbEop9GxDb46GGPhqcixWcar4Xsst\nh0ox0FZEDA23CH9kBQdNlnGP/lGTL1Qc/ANRGtkCgYEAjUmpT2IXbrT5Mdy0I1Oq\n/s/gnNbpw7Bc2YWrVkyOVPK82uU4VCe0yWRhSH1ujq1anKgXDfwYfMiqniLVk00n\nB4IPerDykfZqtL7ZmI4wHMKuvqXa3VTlncKx3r9XIOd2R+/QsmfCtVFx3QPaBIKs\nMtyAYDm7b+cpoAVCYzGYB0w=\n-----END PRIVATE KEY-----\n",
      },
      body: jsonEncode(payload),
    );

    // Add the notification to the list of notifications
    setState(() {
      _notifications.add("$title: $body");
    });
  }




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
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return NotificationTiles(
            title: notification.split(":")[0],
            subtitle: notification.split(":")[1],
            enable: true,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NotificationPage()),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
