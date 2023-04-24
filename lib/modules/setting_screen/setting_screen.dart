import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/setting_model.dart';
import 'package:untitled/modules/edit_profile/edit_profile.dart';
import 'package:untitled/modules/who%20are%20you/Users.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingModel>(
      init: SettingModel(),
      builder: (controller) => Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                    [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          image: DecorationImage(
                            image: controller.userModel == null ? AssetImage('imagies/aa.jpg') : controller.userModel?.pic == 'de' ? AssetImage('imagies/aa.jpg') : AssetImage('imagies/aa.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      Column(
                        children:
                        [
                          Text(
                            '${controller.userModel?.name}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 1.0,
                          ),
                          Text(
                            '${controller.userModel?.email}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100,),
                Container(
                  child: MaterialButton(
                    child: ListTile(
                      title: Text('Edit Profile'),
                      leading: Image.asset('imagies/icons8-edit-profile-24.png'),
                      trailing: Icon(Icons.navigate_next,
                      color: Colors.black,),
                    ),
                    onPressed: (){
                      Get.to(EditProfileScreen());
                    },
                  ),
                ),
                Container(
                  child: MaterialButton(
                    child: ListTile(
                      title: Text('Log Out'),
                      leading: Image.asset('imagies/icons8-log-out-25.png',),
                      trailing: Icon(Icons.navigate_next,
                        color: Colors.black,),
                    ),
                    onPressed: (){
                      controller.signOut();
                      Get.offAll(Users());
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

