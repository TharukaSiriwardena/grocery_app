import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  //create the user collection reference
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //------------------ signup function
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    String name,
  ) async {
    try {
      //---------- send email and password to the firebase and create a user
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) async {
          // value == return of auth -> credential object
          //check if the user credential object is not null
          if (value.user != null) {
            //save other user data in cloud firestore
            await saveUserData(value.user!.uid, name,
                email); //nullable object removed by adding "!"

            //if user created successfully show an alert
            // ignore: use_build_context_synchronously
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

  //------------------ save user data in firestore cloud
  Future<void> saveUserData(String uid, String name, String email) async {
    return users
        // existing document in 'users' collection: uid
        .doc(uid)
        .set(
          {
            'uid': uid,
            'name': name,
            'email': email,
          },
          SetOptions(merge: true),
        )
        .then((value) => Logger().i("user data saved!"))
        .catchError((error) => Logger().e("Failed to save data: $error"));
  }

  //------------------fetch user data saved in cloud firestore
  Future<void> fetchUserData(String uid) async {
    try {
      //-------------------firebase query that fetch user data
      DocumentSnapshot snapshot = await users.doc(uid).get();
      Logger().w(snapshot.data());
    } catch (e) {
      Logger().e(e);
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
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().i('User is currently signed out!');
        UtilFunctions.navigateTo(context, const Signup());
      } else {
        Logger().i('User is signed in!');
        await fetchUserData(user.uid);
        // ignore: use_build_context_synchronously
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
