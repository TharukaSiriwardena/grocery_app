import 'package:flutter/material.dart';
import 'package:grocery_app/state_management_example/provider/counter_provider.dart';
import 'package:provider/provider.dart';
import '../components/custom_text.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

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
                    Provider.of<CounterProvider>(context, listen: false)
                        .decreaseCounter();
                  },
                  child: const CustomText("-"),
                ),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Consumer<CounterProvider>(
                      builder: (context, value, child) {
                        return CustomText(
                          value.counter.toString(),
                          fontSize: 20,
                        );
                      },
                    )),
                ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   counter++;
                    // });

                    Provider.of<CounterProvider>(context, listen: false)
                        .increaseCounter();
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
