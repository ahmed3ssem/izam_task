import '../../view/home/login_view_component.dart';

class LoginPresenterComponent{

  void setView(LoginViewComponent view){}

  bool checkEmailAndPassword(String email , String password){return true;}

  Future<void> checkLoginStatus(String email , String password) async{}
}