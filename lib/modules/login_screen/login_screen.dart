import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/core/viewModel/auth.dart';
import 'package:untitled/modules/forgotPass_screen/forgotPass_screen.dart';
import 'package:untitled/modules/register_screen/register_screen.dart';
import 'package:untitled/shared/components/components.dart';


class LoginScreen extends GetWidget<AuthViewModel> {

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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(
                    'Welcome , ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Enter your creditials',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Sign in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff0CC095),
                        fontSize: 35.0,
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
                      labelText: 'E-mail',
                    //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                          Icons.email_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                      //labelStyle: TextStyle(color: Color(0xff0CC095)),
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: const Text('Forgot your password?'),
                      onTap: () {
                        Get.to(ForgotPassScreen());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff0CC095),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.signInWithEmailAndPassword();
                        }
                      },
                      height: 40.0,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                    ),
                  ),
                ),
              ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 1.0,
                          width: 130.0,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'or',
                        style: TextStyle(fontSize: 22.0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 1.0,
                          width: 130.0,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SocialMediaButton(
                    text: 'sign in with facebook',
                    iconName: AppAssets.facebookIcon,
                    onPress: () {
                      controller.facebookSignInMethod();
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SocialMediaButton(
                    text: 'sign in with google',
                    iconName: AppAssets.googleIcon,
                    onPress: () {
                      controller.googleSignInMethod();
                    },
                  ),
                  SizedBox(height: 15,),
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
                          Get.to(RegisterScreen());
                        },
                        child: Text(
                           "Sign Up",
                          style : TextStyle(
                            fontSize: 15,
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
