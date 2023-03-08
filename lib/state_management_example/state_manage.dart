import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/screens/utils/util_functions.dart';
import 'package:grocery_app/state_management_example/screen2.dart';

class StateManage extends StatefulWidget {
  const StateManage({Key? key}) : super(key: key);

  @override
  State<StateManage> createState() => _StateManageState();
}

class _StateManageState extends State<StateManage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                  child: const CustomText("-"),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomText(
                    '$counter',
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: const CustomText("+"),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                UtilFunctions.navigateTo(context, ScreenTwo(counter: counter));
              },
              child: const CustomText("Go to next Page"),
            )
          ],
        ),
      ),
    );
  }
}