import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class PluginImplementation extends StatefulWidget {
  const PluginImplementation({Key? key}) : super(key: key);

  @override
  State<PluginImplementation> createState() => _PluginImplementationState();
}

class _PluginImplementationState extends State<PluginImplementation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("awesome_dialog Plugin Example")),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Dialog Title',
                desc: 'Dialog description here .........',
                btnOkOnPress: () {},
                btnCancelOnPress: () {},
              ).show();
            },
            child: const Text('Click Me !'),
          ),
        ),
      ),
    );
  }
}
