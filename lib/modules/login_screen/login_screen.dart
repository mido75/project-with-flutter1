import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
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
                      onTap: () {},
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
                      onPressed: (){},
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
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaButton(
                        iconName: AppAssets.facebookIcon,
                        onPress: () {},
                      ),
                      SizedBox(width: 16.0),
                      SocialMediaButton(
                        iconName: AppAssets.googleIcon,
                        onPress: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text('Don\'t have an account?',),
                      TextButton(
                          onPressed: (){},
                          child: Text(
                            'sign up',
                            style: TextStyle(color: Color(0xff0CC095)),
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
