import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/screens/auth/signup.dart';
import 'package:grocery_app/screens/main/main_screen.dart';
import 'package:grocery_app/screens/utils/alert_helper.dart';
import 'package:grocery_app/screens/utils/util_functions.dart';
import 'package:logger/logger.dart';

class AuthController {
  //firebase auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  //------------------ signup function
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      //---------- send email and password to the firebase and create a user
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          // value == return of auth -> credential object
          //check if the user credential object is not null
          if (value.user != null) {
            //if user created successfully show an alert
            AlertHelper.showAlert(context, DialogType.SUCCES, "Success",
                "User created successfully !");
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      //-----------Show error dialog
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR", e.code);
    } catch (e) {
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR", e.toString());
    }
  }

  //------------------ sign in user function
  Future<void> signInUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      //---------- send email and password to the firebase and check if the user is exist or not
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      //-----------Show error dialog
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR", e.code);
    } catch (e) {
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR", e.toString());
    }
  }

  //------------initialize and check whether the user is signed in or not
  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Logger().i('User is currently signed out!');
        UtilFunctions.navigateTo(context, const Signup());
      } else {
        Logger().i('User is signed in!');
        UtilFunctions.navigateTo(context, const MainScreen());
      }
    });
  }

  //------------signout function
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  //------------send password reset email
  Future<void> sendPassResetEmail(BuildContext context, String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
        //---------sshow a dialog when the email is sent
        (value) => AlertHelper.showAlert(context, DialogType.SUCCES,
            "Email sent!", "Please check your inbox !"));
  }
}
