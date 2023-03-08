import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  //--------------- counter state
  final int _counter = 0;

  //---------getter for access counter state
  int get counter => _counter;
}
