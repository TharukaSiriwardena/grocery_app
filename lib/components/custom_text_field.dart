import 'package:flutter/material.dart';
import 'package:grocery_app/screens/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.isObscure = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: AppColors.kWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: AppColors.kAsh.withOpacity(.2),
            blurRadius: 5,
            //spreadRadius : 5,
          )
        ],
      ),
      child: TextField(
        controller: controller, // controll the text being edited
        obscureText: isObscure, // to hide the password
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.kAsh),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(color: AppColors.kWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(color: AppColors.kRed),
          ),
        ),
      ),
    );
  }
}
