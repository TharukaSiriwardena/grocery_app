import 'package:flutter/material.dart';
import '../components/custom_text.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key, required this.counter}) : super(key: key);

  final int counter;

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
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
                    // setState(() {
                    //   counter--;
                    // });
                  },
                  child: const CustomText("-"),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomText(
                    '${widget.counter}',
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   counter++;
                    // });
                  },
                  child: const CustomText("+"),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const CustomText("Go Back"),
            )
          ],
        ),
      ),
    );
  }
}
