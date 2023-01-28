import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/screens/utils/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final Function() onTap;

  const SocialButton({
    Key? key,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 34),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: AppColors.kAsh.withOpacity(.2),
              blurRadius: 5,
            )
          ],
        ),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
