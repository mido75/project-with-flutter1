import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/auth.dart';
import 'package:untitled/modules/login_screen/login_screen.dart';
import 'package:untitled/shared/components/components.dart';


class RegisterScreen extends GetWidget<AuthViewModel> {
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var usercontroller = TextEditingController();
  var passComcontroller = TextEditingController();
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
                children: [
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
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff0CC095),
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: usercontroller,
                    keyboardType: TextInputType.text,
                    onSaved: (value){
                      controller.name= value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'UserName',
                      //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value){
                      controller.email=value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
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
                    controller: phonecontroller,
                    keyboardType: TextInputType.number,
                    onSaved: (value){
                      controller.phone=value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'PhoneNumber',
                      //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                        Icons.phone,
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
                      controller.password=value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
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
                  TextFormField(
                    controller: passComcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (value){
                      controller.passwordCon=value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //labelStyle: TextStyle(color: Color(0xff0CC095)),
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                      ),
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
                      onPressed: () {
                        _formKey.currentState!.save();

                        if (_formKey.currentState!.validate()) {
                          controller.createAccountWithEmailAndPassword();
                        }
                      },
                      height: 40.0,
                      child: Text(
                        'Sign Up',
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
