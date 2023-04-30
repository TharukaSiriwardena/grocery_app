import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

import 'package:grocery_app/providers/auth/signup_provider.dart';
import 'package:grocery_app/screens/auth/login.dart';

import 'package:grocery_app/screens/utils/app_colors.dart';
import 'package:grocery_app/screens/utils/assets_constants.dart';
import 'package:grocery_app/screens/utils/util_functions.dart';

import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_text_field.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                  controller:
                      Provider.of<SignupProvider>(context).nameController,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Email',
                  controller:
                      Provider.of<SignupProvider>(context).emailController,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Password',
                  isObscure: true,
                  controller:
                      Provider.of<SignupProvider>(context).passwordController,
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
                Consumer<SignupProvider>(
                  builder: (context, value, child) {
                    return CustomButton(
                      text: 'Signup',
                      isLoading: value.isLoading,
                      onTap: () => value.startSignup(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
