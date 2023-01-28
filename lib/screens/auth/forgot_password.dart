import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/screens/auth/login.dart';
import 'package:grocery_app/screens/utils/alert_helper.dart';
import 'package:grocery_app/screens/utils/app_colors.dart';
import 'package:grocery_app/screens/utils/assets_constants.dart';
import 'package:grocery_app/screens/utils/util_functions.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                const CustomText(
                  'ForgotPassword',
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
                const SizedBox(height: 100),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      UtilFunctions.navigateTo(context, const Login());
                    },
                    child: const CustomText(
                      'Please, enter your email address. You will receive a link to create a new password via email.',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 53),
                CustomButton(
                  text: 'Send Reset Email',
                  isLoading: isLoading,
                  onTap: () async {
                    if (validateFields()) {
                      //---------start the loader
                      setState(() {
                        isLoading = true;
                      });

                      await AuthController()
                          .sendPassResetEmail(context, emailController.text);

                      //--------clear textfields
                      emailController.clear();

                      //---------stop the loader
                      setState(() {
                        isLoading = false;
                      });
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
    if (emailController.text.isEmpty) {
      //------------ show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please fill all the fields !");
      return false;
    } else if (!emailController.text.contains("@")) {
      //---------- show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please enter a valid email !");
      return false;
    } else {
      return true;
    }
  }
}
