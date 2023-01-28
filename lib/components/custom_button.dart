import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/screens/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 259,
          height: 50,
          alignment: Alignment.center, // align the container child
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isLoading
              // ? const CircularProgressIndicator(color: AppColors.kWhite)
              ? const SpinKitRotatingCircle(
                  color: Colors.white,
                  size: 40.0,
                )
              : CustomText(
                  text,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.kWhite,
                ),
        ),
      ),
    );
  }
}
