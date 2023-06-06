import 'package:get/get.dart';
import 'package:izam_task/helper/dbhelper.dart';
import 'package:izam_task/utils/app_colors.dart';
import 'package:izam_task/view/login/login_view_component.dart';
import 'package:izam_task/widget/message_widget.dart';
import 'login_presenter_component.dart';

class LoginPresenter implements LoginPresenterComponent {
  late LoginViewComponent component;

  /// Checks the login status of the user based on the provided email and password.
  /// Displays a success message if the user is logged in successfully.
  /// Displays a first-time login message if it's the user's first login.
  ///
  /// @param string email
  /// @param string password
  @override
  bool checkEmailAndPassword(String email, String password) {
    final emailPattern = RegExp(r'^[a-zA-Z]+\.\d+@[a-zA-Z]+\.[a-zA-Z]+$');
    final passwordPattern = RegExp(r'^(?=.*\d)(?=.*[!$#^*@]).{8,}$');

    if (email.isEmpty || password.isEmpty) {
      MessageWidget.showSnackBar('emptyMailOrPassword'.tr, AppColors.red);
      return false;
    }

    if (!emailPattern.hasMatch(email)) {
      MessageWidget.showSnackBar('wrongValidateEmail'.tr, AppColors.red);
      return false;
    }

    if (!passwordPattern.hasMatch(password)) {
      MessageWidget.showSnackBar('wrongValidatePassword'.tr, AppColors.red);
      return false;
    }

    checkLoginStatus(email, password);
    return true;
  }

  /// Sets the view component for the presenter.
  @override
  void setView(LoginViewComponent view) {
    component = view;
  }

  /// Checks the login status of the user based on the provided email and password.
  ///
  /// Displays a success message if the user is logged in successfully.
  /// Displays a first-time login message if it's the user's first login.
  @override
  Future<void> checkLoginStatus(String email, String password) async {
    final databaseHelper = DatabaseHelper.instance;
    final user = await databaseHelper.isUserStored(email, password);
    if (!user!['exists']) {
      MessageWidget.showSnackBar('firstTimeLogin'.tr, AppColors.green);
    } else {
      MessageWidget.showSnackBar('loginSuccess'.tr + user['data'].toString(), AppColors.green);
    }
  }
}
