import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/layout/shop_layout.dart';
import 'package:untitled/layout/shop_layout_t.dart';
import 'package:untitled/modules/control_view.dart';
import 'package:untitled/modules/home/home_screen.dart';
import 'package:untitled/modules/login_screen/login_screen.dart';
import 'package:untitled/modules_trader/home_screen_t/home_screen_t.dart';
import 'package:untitled/modules_trader/login_screen_t/login_screen_t.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/constants/constants.dart';

class Users extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("imagies/269969424_655870578924985_1432197706298581466_nn.png"),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Start With',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff0CC095),
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff0CC095),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: MaterialButton(
                  onPressed: (){
                    trader =0;
                    Get.to(ShopLayout());
                  },
                  height: 40.0,
                  child: Text(
                    'User',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff0CC095),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: MaterialButton(
                  onPressed: (){
                    trader = 1;
                    Get.to(ShopLayout_T());
                  },
                  height: 40.0,
                  child: Text(
                    'Trader',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
