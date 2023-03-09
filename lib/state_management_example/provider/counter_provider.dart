import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  //--------------- counter state
  int _counter = 0;

  //---------getter for access counter state
  int get counter => _counter;

  //---------setter for decreasing the counter
  void decreaseCounter() {
    _counter--;
    notifyListeners();
  }

  //---------setter for increasing the counter
  void increaseCounter() {
    _counter++;
    notifyListeners();
  }
}
