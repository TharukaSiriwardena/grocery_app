import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/screens/main/favourite/favourite.dart';
import 'package:grocery_app/screens/main/home/home.dart';
import 'package:grocery_app/screens/main/profile/profile.dart';
import 'package:grocery_app/screens/main/search/search.dart';
import 'package:grocery_app/screens/utils/app_colors.dart';

import 'package:grocery_app/screens/utils/assets_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //-----------list store bottom navigation screens
  final List<Widget> _screens = [
    const Home(),
    const Favourite(),
    const Search(),
    const Profile(),
  ];

  //-------------store the active index
  int activeIndex = 0;

  //-------------ontap function
  void onItemTapped(int i) {
    setState(() {
      activeIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[activeIndex],
      bottomNavigationBar: SizedBox(
        height: 83,
        //color: AppColors.kRed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: SvgPicture.asset(
                AssetsConstants.homeIcon,
                color:
                    activeIndex == 0 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () => onItemTapped(0),
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetsConstants.favIcon,
                color:
                    activeIndex == 1 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () => onItemTapped(1),
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetsConstants.searchIcon,
                color:
                    activeIndex == 2 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () => onItemTapped(2),
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetsConstants.profileIcon,
                color:
                    activeIndex == 3 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () => onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
