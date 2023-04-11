
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/core/service/firestore_user.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/modules/begin/begin_screen.dart';
import 'package:untitled/modules/control_view.dart';
import 'package:untitled/modules/home/home_screen.dart';
import 'package:untitled/modules/who%20are%20you/Users.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  //FacebookLogin _facebookLogin = FacebookLogin();

  late String email, password, name , passwordCon , phone;

  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication? googleSignInAuthentication =
    await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication!.idToken,
      accessToken: googleSignInAuthentication!.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
    });
  }

  void facebookSignInMethod() async {
/*
    FacebookLoginResult result = await _facebookLogin.logIn();
    final AccessToken = result.accessToken!.token;
    if(result.status == FacebookLoginStatus.loggedIn) {
      final faceCedential = FacebookAuthProvider.credential(AccessToken);
      await _auth.signInWithCredential(faceCedential);
    }

 */
    final LoginResult result = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(result.accessToken!.token);
    await _auth.signInWithCredential(facebookAuthCredential).then((user) {
      saveUser(user);
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password).then((user) async{
            saveUser(user);
      });

      Get.offAll(ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  void saveUser(UserCredential user) async {

    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      phone: phone,
      name: name == null ? user.user!.displayName : name,
      pic: '',
    ));
  }


  Future passwordReset({required controlEmail , required context }) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: controlEmail);
      AlertDialog(
        content: Text('password reset ! check your mail'),
      );
    }on FirebaseAuthException catch(e){
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },);
    }
  }

  changeScreen(){
    Future.delayed(const Duration(seconds: 4),(){
      Get.to(() => BeginScreen());
    });
  }


}