import 'package:flutter/material.dart';
import 'package:untitled/shared/styles/color.dart';

class SearchScreen extends StatelessWidget {

  final String? text;
  SearchScreen({required this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: defualtColor,
        title: Text('${text}',style: TextStyle(color: Colors.black38),),
      ),
    );
  }
}
