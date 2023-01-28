import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';

import 'package:grocery_app/components/custom_text.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Container(
        child: const Center(
          child: CustomText(
            "Favourite",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
