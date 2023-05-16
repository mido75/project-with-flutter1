import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final Function onTap;
  final bool enable;
  const NotificationTiles({
    Key? key, required this.title, required this.subtitle, required this.onTap, required this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50.0.h,
          width: 50.0.w,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(
                  "imagies/269969424_655870578924985_1432197706298581466_nn.png"), fit: BoxFit.cover))),
      title: Text(title, style: TextStyle(color: Colors.black)),
      subtitle: Text(subtitle,
          style: TextStyle(color: Colors.grey)),
      onTap:  () =>onTap(),
      enabled: enable,
    );
  }
}