import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../../controllers/auth_controller.dart';
import '../../screens/utils/alert_helper.dart';

class SignupProvider extends ChangeNotifier {
  // ---------------- email text controller
  final _emailController = TextEditingController();
  //----------- get emailController
  TextEditingController get emailController => _emailController;

  // ----------------password controller
  final _passwordController = TextEditingController();
  //----------- get passwordController
  TextEditingController get passwordController => _passwordController;

  // ----------------name controller
  final _nameController = TextEditingController();
  //----------- get nameController
  TextEditingController get nameController => _nameController;

  //------------------loader state
  bool _isLoading = false;
  //----------- get isLoading
  bool get isLoading => _isLoading;

  //-------------- change loading state
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // --------------- validate textfield function
  bool validateFields(BuildContext context) {
    // ----------- first checking all the text fields are empty or not
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _nameController.text.isEmpty) {
      //------------ show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please fill all the fields !");
      return false;
    } else if (!_emailController.text.contains("@")) {
      //---------- show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please enter a valid email !");
      return false;
    } else if (_passwordController.text.length < 6) {
      //--------- show error dialog
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR",
          "Password have more than 6 digits !");
      return false;
    } else {
      return true;
    }
  }

  //------------ start signup process
  Future<void> startSignup(BuildContext context) async {
    try {
      if (validateFields(context)) {
        //Logger().i("validation success");

        //---------start the loader

        setLoading(true);

        await AuthController().registerUser(
          context,
          _emailController.text,
          _passwordController.text,
          _nameController.text,
        );

        //--------clear textfields
        _nameController.clear();
        _emailController.clear();
        _passwordController.clear();

        //---------stop the loader

        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      Logger().e(e);
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR", e.toString());
    }
  }
}
