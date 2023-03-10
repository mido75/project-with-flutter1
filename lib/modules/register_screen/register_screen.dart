import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';

class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    controller: emailcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
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
                    controller: emailcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(

                      border:OutlineInputBorder(),
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
                  TextFormField(
                    controller: passcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
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
                      onPressed: (){},
                      height: 40.0,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text('have an account?',),
                      TextButton(
                        onPressed: (){},
                        child: Text(
                          'sign in',
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
