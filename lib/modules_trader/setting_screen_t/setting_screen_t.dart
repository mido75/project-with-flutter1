import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/setting_model.dart';
import 'package:untitled/modules/control_view.dart';
import 'package:untitled/modules/edit_profile/edit_profile.dart';
import 'package:untitled/modules/language_screen/language_screen.dart';
import 'package:untitled/modules/who%20are%20you/Users.dart';
import 'package:untitled/modules_trader/manager_products/manager_products.dart';
import 'package:untitled/modules_trader/my_products_screen/my_products_screen.dart';
import 'package:untitled/modules_trader/orders_screen/orders_screen.dart';

class SettingScreen_T extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingModel>(
      init: SettingModel(),
      builder: (controller) => controller.loading == true
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 190.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Container(
                          height: 140.0,
                          width: double.infinity,
                          decoration: controller.currentUser!.cover != null ?  BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage('${controller.currentUser!.cover}'),
                              fit: BoxFit.cover,
                            ),
                          ) : BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://png.pngtree.com/thumb_back/fh260/background/20200630/pngtree-neon-double-color-futuristic-frame-colorful-background-image_340466.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      CircleAvatar(
                        radius: 63.0,
                        backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/02/14/74/61/240_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg'),
                          foregroundImage: controller.currentUser!.pic != null
                              ? NetworkImage('${controller.currentUser!.pic}')
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${controller.currentUser!.name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Text(
                  '${controller.currentUser!.email}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: MaterialButton(
                    child: ListTile(
                      title: Text('Edit Profile'),
                      leading: Image.asset(
                          'imagies/icons8-edit-profile-24.png'),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Get.to(EditProfileScreen());
                    },
                  ),
                ),
                Container(
                  child: MaterialButton(
                    child: ListTile(
                      title: Text('My Products'),
                      leading: Image.asset(
                        'imagies/icons8-shopping-cart-32.png',
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Get.to(ManageProducts());
                    },
                  ),
                ),
                Container(
                  child: MaterialButton(
                    child: ListTile(
                      title: Text('Orders'),
                      leading: Image.asset(
                        'imagies/icons8-in-transit-24.png',
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Get.to(OrdersScreen());
                    },
                  ),
                ),
                Container(
                  child: MaterialButton(
                    child: ListTile(
                      title: Text('Language'),
                      leading: Image.asset(
                        'imagies/icons8-globe-24.png',
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Get.to(LanguageScreen());
                    },
                  ),
                ),
                Container(
                  child: MaterialButton(
                    child: ListTile(
                      title: Text('Location'),
                      leading: Image.asset(
                        'imagies/icons8-location-24.png',
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: MaterialButton(
                    child: ListTile(
                      title: Text('Log Out'),
                      leading: Image.asset(
                        'imagies/icons8-log-out-25.png',
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      controller.signOut();
                      Get.offAll(ControlView());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
