import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/screens/auth/forgot_password.dart';

import 'package:grocery_app/screens/utils/alert_helper.dart';
import 'package:grocery_app/screens/utils/app_colors.dart';
import 'package:grocery_app/screens/utils/assets_constants.dart';
import 'package:grocery_app/screens/utils/util_functions.dart';
import 'package:logger/logger.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_text_field.dart';
import '../../components/social_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ---------------- email text controller
  final emailController = TextEditingController();

  // ----------------password controller
  final passwordController = TextEditingController();

  //------------------loader state
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // get the screen width and height
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), // user friendly exprience
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: size.width, // width of the running device
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 52),
                const CustomText(
                  'Login',
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(height: 52),
                Image.asset(
                  AssetsConstants.logo,
                  width: 202,
                  height: 138,
                ),
                const SizedBox(height: 39),
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
                    onTap: () => UtilFunctions.navigateTo(
                      context,
                      const ForgotPassword(),
                    ),
                    child: const CustomText(
                      'Forgot your password?',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 29),
                CustomButton(
                  text: 'Login',
                  isLoading: isLoading,
                  onTap: () async {
                    if (validateFields()) {
                      //---------start the loader
                      setState(() {
                        isLoading = true;
                      });

                      await AuthController().signInUser(context,
                          emailController.text, passwordController.text);

                      //--------clear textfields
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
                const SizedBox(height: 23),
                const CustomText(
                  'Or login with social account',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      iconPath: AssetsConstants.googleIcon,
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    SocialButton(
                      iconPath: AssetsConstants.fbIcon,
                      onTap: () {},
                    ),
                  ],
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
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
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
