import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/screens/utils/assets_constants.dart';

import '../../utils/app_colors.dart';
import 'widgets/product_grid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AssetsConstants.menuIcon),
                  Row(
                    children: [
                      SvgPicture.asset(AssetsConstants.cartIcon),
                      IconButton(
                        onPressed: () {
                          AuthController().logOut();
                        },
                        icon: const Icon(Icons.logout),
                      )
                    ],
                  )
                ],
              ),
              const CustomText(
                'Vegetables',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
              const SizedBox(height: 41),
              const ProductGrid()
            ],
          ),
        ),
      ),
    );
  }
}
