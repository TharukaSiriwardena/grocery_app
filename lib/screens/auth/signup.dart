import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/screens/auth/login.dart';
import 'package:grocery_app/screens/utils/alert_helper.dart';
import 'package:grocery_app/screens/utils/app_colors.dart';
import 'package:grocery_app/screens/utils/assets_constants.dart';
import 'package:grocery_app/screens/utils/util_functions.dart';
import 'package:logger/logger.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_text_field.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // ---------------- email text controller
  final emailController = TextEditingController();

  // ----------------password controller
  final passwordController = TextEditingController();

  // ----------------name controller
  final nameController = TextEditingController();

  //------------------loader state
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 52),
                FadeInDownBig(
                  child: const CustomText(
                    'Signup',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 52),
                FadeInUpBig(
                  child: Image.asset(
                    AssetsConstants.logo,
                    width: 202,
                    height: 138,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Name',
                  controller: nameController,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Password',
                  isObscure: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      UtilFunctions.navigateTo(context, const Login());
                    },
                    child: const CustomText(
                      'Already have an account?',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Signup',
                  isLoading: isLoading,
                  onTap: () async {
                    if (validateFields()) {
                      //Logger().i("validation success");

                      //---------start the loader
                      setState(() {
                        isLoading = true;
                      });

                      await AuthController().registerUser(
                        context,
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                      );

                      //--------clear textfields
                      nameController.clear();
                      emailController.clear();
                      passwordController.clear();

                      //---------stop the loader
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      Logger().e("validation failed");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --------------- validate textfield function
  bool validateFields() {
    // ----------- first checking all the text fields are empty or not
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty) {
      //------------ show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please fill all the fields !");
      return false;
    } else if (!emailController.text.contains("@")) {
      //---------- show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please enter a valid email !");
      return false;
    } else if (passwordController.text.length < 6) {
      //--------- show error dialog
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR",
          "Password have more than 6 digits !");
      return false;
    } else {
      return true;
    }
  }
}
