import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/styles/color.dart';



class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget child;
  final action;
  const DefaultAppBar({
    Key? key, required this.title, required this.child, this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0.h);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: defualtColor)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 10.0,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: defualtColor),
      leading: child,
      actions: action,
    );
  }
}