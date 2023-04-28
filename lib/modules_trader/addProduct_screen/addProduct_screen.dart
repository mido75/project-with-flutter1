import 'package:flutter/material.dart';
import 'package:untitled/shared/styles/color.dart';

class addProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defualtColor,
        leading: BackButton(),
        title: Text('Add Your Product'),
      ),
    );
  }
}
