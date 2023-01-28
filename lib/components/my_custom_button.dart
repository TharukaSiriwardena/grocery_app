import 'package:flutter/material.dart';

class MyCustomButton extends StatefulWidget {
  final String text;

  const MyCustomButton(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 259.0,
      height: 50.0,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 10,
            primary: Colors.green,
            textStyle: const TextStyle(fontSize: 18.0),
            padding: const EdgeInsets.all(10.0),
          ),
          child: const Text('Login')),
    );
  }
}
