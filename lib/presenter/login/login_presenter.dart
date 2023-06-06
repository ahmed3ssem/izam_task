import 'package:get/get.dart';
import 'package:izam_task/helper/dbhelper.dart';
import 'package:izam_task/utils/app_colors.dart';
import 'package:izam_task/view/login/login_view_component.dart';
import 'package:izam_task/widget/message_widget.dart';
import 'login_presenter_component.dart';

class LoginPresenter implements LoginPresenterComponent{

  late LoginViewComponent component;


  @override
  bool checkEmailAndPassword(String email , String password) {
    RegExp emailPattern = RegExp(r'^[a-zA-Z]+\.\d+@[a-zA-Z]+\.[a-zA-Z]+$');
    RegExp passwordPattern = RegExp(r'^(?=.*\d)(?=.*[!$#^*@]).{8,}$');
    if(email.isEmpty){
      MessageWidget.showSnackBar('emptyMail'.tr, AppColors.red);
      return false;
    }
    if (!emailPattern.hasMatch(email)) {
      MessageWidget.showSnackBar('wrongValidateEmail'.tr, AppColors.red);
      return false;
    }
    if(password.isEmpty){
      MessageWidget.showSnackBar('emptyPassword'.tr, AppColors.red);
      return false;
    }
    if (!passwordPattern.hasMatch(password)) {
      MessageWidget.showSnackBar('wrongValidatePassword'.tr, AppColors.red);
      return false;
    }
    checkLoginStatus(email, password);
    return true;
  }

  @override
  void setView(LoginViewComponent view) {
    component = view;
  }

  @override
  Future<void> checkLoginStatus(String email , String password) async{
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    Map<String, dynamic>? user = await databaseHelper.isUserStored(email, password);
    if(!user!['exists']){
      MessageWidget.showSnackBar('firstTimeLogin'.tr, AppColors.green);
    } else{
      MessageWidget.showSnackBar('loginSuccess'.tr+user['data'].toString(), AppColors.green);
    }
  }

}