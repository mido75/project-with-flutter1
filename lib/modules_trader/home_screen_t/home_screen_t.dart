import 'package:flutter/material.dart';
import 'package:untitled/shared/styles/color.dart';

class HomeScreen_T extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defualtColor,
        title: Text('hello trader'),
      ),
    );
  }
}
