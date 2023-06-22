// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'defaultAppBar.dart';
// import 'notificationTiles.dart';
// import 'notificationPage.dart';
// import 'defaultBackButton.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
//
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Firebase Notification Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: NotificationList(),
// //     );
// //   }
// // }
//
// class NotificationList extends StatefulWidget {
//   NotificationList({Key? key}) : super(key: key);
//
//   @override
//   _NotificationListState createState() => _NotificationListState();
// }
//
// class _NotificationListState extends State<NotificationList> {
//   final DatabaseReference _database = FirebaseDatabase.instance.reference();
//   final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//
//   List<String> _notifications = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Listen for changes to the "products" node in the database
//     _database.child("products").onChildAdded.listen((event) {
//       // When a new child is added to the "products" node, send a notification
//       final product = event.snapshot.value as Map<dynamic, dynamic>;
//       final productName = product["name"] as String;
//       _sendNotification("New Product Added", "Product Name: $productName");
//     });
//
//     // Configure Firebase Messaging to handle incoming notifications
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       // When a notification is received while the app is in the foreground, show an alert dialog
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(message.notification?.title ?? ""),
//             content: Text(message.notification?.body ?? ""),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: Text("OK"),
//               ),
//             ],
//           );
//         },
//       );
//     });
//
//     // Request permission to send notifications
//     _messaging.requestPermission();
//   }
//
//   Future<void> _sendNotification(String title, String body) async {
//     // Get the FCM token for this device
//     final token = await _messaging.getToken();
//
//     // Prepare the notification payload
//     final payload = <String, dynamic>{
//       "notification": {
//         "title": title,
//         "body": body,
//       },
//       "to": token,
//     };
//
//     // Send the notification to Firebase Cloud Messaging
//     await http.post(
//       Uri.parse("https://fcm.googleapis.com/fcm/send"),
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "key=YOUR_SERVER_KEY",
//       },
//       body: jsonEncode(payload),
//     );
//
//     // Add the notification to the list of notifications
//     setState(() {
//       _notifications.add("$title: $body");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: DefaultAppBar(
//         title: 'Notifications',
//         child: DefaultBackButton(),
//       ),
//       body: ListView.separated(
//         physics: ClampingScrollPhysics(),
//         padding: EdgeInsets.zero,
//         itemCount: _notifications.length,
//         itemBuilder: (context, index) {
//           final notification = _notifications[index];
//           return NotificationTiles(
//             title: notification.split(":")[0],
//             subtitle: notification.split(":")[1],
//             enable: true,
//             onTap: () => Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => NotificationPage()),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return Divider();
//         },
//       ),
//     );
//   }
// }