import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/screens/utils/app_colors.dart';
import 'package:grocery_app/screens/utils/assets_constants.dart';


import '../../components/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 3), () {
    //   Logger().w('im calling');

    //   UtilFunctions.navigateTo(context, const Signup());
    // });
    AuthController().initializeUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Bounce(
              duration: const Duration(milliseconds: 2000),
              child: Image.asset(AssetsConstants.logo),
            ),
            const SizedBox(
              height: 72.44,
            ),
            FadeInUp(
              delay: const Duration(microseconds: 100),
              child: const CustomText(
                'Shop Your Daily \nNecessary',
                textAlign: TextAlign.center,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
