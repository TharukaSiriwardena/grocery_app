import 'package:flutter/material.dart';

import 'package:grocery_app/providers/auth/login_provider.dart';
import 'package:grocery_app/screens/auth/forgot_password.dart';

import 'package:grocery_app/screens/utils/app_colors.dart';
import 'package:grocery_app/screens/utils/assets_constants.dart';
import 'package:grocery_app/screens/utils/util_functions.dart';

import 'package:provider/provider.dart';

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
                  controller:
                      Provider.of<LoginProvider>(context).emailController,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Password',
                  isObscure: true,
                  controller:
                      Provider.of<LoginProvider>(context).passwordController,
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
                Consumer<LoginProvider>(
                  builder: (context, value, child) {
                    return CustomButton(
                      text: 'Login',
                      isLoading: value.isLoading,
                      onTap: () => value.startLogin(context),
                    );
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
}
