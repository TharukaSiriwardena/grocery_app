import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';

import 'package:grocery_app/components/custom_text.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Container(
        child: const Center(
          child: CustomText(
            "Profile",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
