import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';

import 'package:grocery_app/components/custom_text.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Container(
        child: const Center(
          child: CustomText(
            "Search",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
