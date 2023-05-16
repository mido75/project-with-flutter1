import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/core/viewModel/auth.dart';
import 'package:untitled/core_trader/viewModel_trader/auth_trader.dart';
import 'package:untitled/modules/forgotPass_screen/forgotPass_screen.dart';
import 'package:untitled/modules/register_screen/register_screen.dart';
import 'package:untitled/modules_trader/forgetpass_screen_t/forgetpass_screen_t.dart';
import 'package:untitled/modules_trader/register_screen_t/register_screen_t.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/color.dart';


class LoginScreen_T extends GetWidget<AuthViewModel> {

  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(
                    'Welcome , ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Enter your creditials',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: Text(
                      'Sign in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff0CC095),
                        fontSize: 35.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value){
                      controller.email= value!;
                    },
                    validator: (value){
                      if (value == null) {
                        print("ERROR");
                      }
                    },
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor,width: 2.0.w),
                      ),
                      labelText: 'E-mail',
                      //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    controller: passcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (value){
                      controller.password = value!;
                    },
                    validator: (value){
                      if (value == null) {
                        print("ERROR");
                      }
                    },
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor,width: 2.0.w),
                      ),
                      //labelStyle: TextStyle(color: Color(0xff0CC095)),
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: const Text('Forgot your password?'),
                      onTap: () {
                        Get.to(ForgotPassScreen_T());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff0CC095),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ).w,
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.signInWithEmailAndPassword();
                        }
                      },
                      height: 40.0.h,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0).w,
                        child: Container(
                          height: 1.0.h,
                          width: 130.0.w,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'or',
                        style: TextStyle(fontSize: 22.0.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0).w,
                        child: Container(
                          height: 1.0.h,
                          width: 130.0.w,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SocialMediaButton(
                    text: 'sign in with facebook',
                    iconName: AppAssets.facebookIcon,
                    onPress: () {
                      controller.facebookSignInMethod();
                    },
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  SocialMediaButton(
                    text: 'sign in with google',
                    iconName: AppAssets.googleIcon,
                    onPress: () {
                      controller.googleSignInMethod();
                    },
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text('Don\'t have an account?',),
                      /*TextButton(
                          onPressed: (){
                          //  Get.to(RegisterScreen());
                          },
                          child: Text(
                            'sign up',
                            style: TextStyle(color: Color(0xff0CC095)),
                          ),
                      ),

                       */
                      GestureDetector(
                        onTap: () {
                          Get.to(RegisterScreen_T());
                        },
                        child: Text(
                          "Sign Up",
                          style : TextStyle(
                            fontSize: 15.sp,
                            color: Color(0xff0CC095),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
