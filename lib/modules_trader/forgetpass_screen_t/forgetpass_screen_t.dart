import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/auth.dart';
import 'package:untitled/shared/components/components.dart';

class ForgotPassScreen_T extends GetWidget<AuthViewModel> {
  var emailcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.end,
                children:
                [
                  Center(
                    child: Text(
                      'Forgot Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff0CC095),
                        fontSize: 35.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      'Request Chaining the password',
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(

                      border:OutlineInputBorder(),
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
                        controller.passwordReset(controlEmail: emailcontroller.text.toString(), context: context);
                      },
                      height: 40.0.h,
                      child: Text(
                        'Send Message',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
