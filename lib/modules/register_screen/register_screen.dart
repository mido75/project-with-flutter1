import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/auth.dart';
import 'package:untitled/modules/login_screen/login_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/color.dart';


class RegisterScreen extends GetWidget<AuthViewModel> {
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var usercontroller = TextEditingController();
  var passComcontroller = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;

  }



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
                children: [
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
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff0CC095),
                        fontSize: 35.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    cursorColor: defualtColor,
                    controller: usercontroller,
                    keyboardType: TextInputType.text,
                    onSaved: (value){
                      controller.name= value!;
                    },
                    decoration: InputDecoration(

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor,width: 2.0.w),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      labelText: 'UserName',
                      labelStyle: TextStyle(
                        color: defualtColor,
                      ),
                      fillColor: defualtColor,
                      //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                        color: defualtColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    cursorColor: defualtColor,
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value){
                      controller.email=value!;
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor,width: 2.0.w),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        color: defualtColor,
                      ),
                      fillColor: defualtColor,
                      //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: defualtColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    cursorColor: defualtColor,
                    controller: phonecontroller,
                    keyboardType: TextInputType.number,
                    onSaved: (value){
                      controller.phone=value!;
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor,width: 2.0.w),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      labelText: 'PhoneNumber',
                      labelStyle: TextStyle(
                        color: defualtColor,
                      ),
                      fillColor: defualtColor,
                      //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: defualtColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    cursorColor: defualtColor,
                    controller: passcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (value){
                      controller.password=value!;
                    },
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(

                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor,width: 2.0.w),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      //labelStyle: TextStyle(color: Color(0xff0CC095)),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: defualtColor,
                      ),
                      fillColor: defualtColor,
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: defualtColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: defualtColor,
                        ),
                        onPressed: () {
                          togglePasswordVisibility();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    cursorColor: defualtColor,
                    controller: passComcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (value){
                      controller.passwordCon=value!;
                    },
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor,width: 2.0.w),
                      ),
                      //labelStyle: TextStyle(color: Color(0xff0CC095)),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        color: defualtColor,
                      ),
                      fillColor: defualtColor,
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: defualtColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: defualtColor,
                        ),
                        onPressed: () {
                          togglePasswordVisibility();
                        },
                      ),
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
                      onPressed: () {
                        _formKey.currentState!.save();

                        if (_formKey.currentState!.validate()) {
                          controller.createAccountWithEmailAndPassword();
                        }
                      },
                      height: 40.0.h,
                      child: Text(
                        'Sign Up',
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
                      Text(
                        'have an account?',
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
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
