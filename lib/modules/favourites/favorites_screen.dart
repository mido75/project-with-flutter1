import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  List<String> names = <String>[
    "Name",
    "Name",
    "Name",
  ];
  List<String> images = <String>[
    'imagies/Ellipse5.png',
    'imagies/Ellipse5.png',
    'imagies/Ellipse5.png',
  ];
  List<int> prices =<int> [
    100,200,300,
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(),
    );
  }
}
