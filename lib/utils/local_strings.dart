import 'package:get/get.dart';

class LocalStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar_AR': {
      "signUp": "انشاء حساب",
      "signIn": "تسجيل الدخول",
    },
    'en_US': {
      "signIn": "Sign In",
      "signUp": "Sign Up",
      "email":"E-mail",
      "password":"Password",
      "forgotPassword":"Forgot Password ?",
      "loginPhase":"Welcome , Log In",
      "firstTimeLogin":"This is your first time login.",
      "loginSuccess":"Congrats , this is the logging number ",
      "emptyMailOrPassword":"Email and password shouldn't be empty.",
      "wrongValidateEmail":"Your email isn't valid , your email should be like ahmed.233@izam.com",
      "wrongValidatePassword":"Your password isn't valid , your password should be no less than 8 characters, and at least 1 number, and one special character.",
    },
  };
}