import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:izam_task/presenter/login/login_presenter.dart';
import 'package:izam_task/presenter/login/login_presenter_component.dart';
import 'package:izam_task/utils/app_colors.dart';
import 'package:izam_task/widget/button_widget.dart';
import 'package:izam_task/widget/text_field_widget.dart';

import 'login_view_component.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> implements LoginViewComponent {
  late LoginPresenterComponent component;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    component = LoginPresenter();
    component.setView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpeg',
              width: ScreenUtil().setWidth(141),
              height: ScreenUtil().setHeight(37),
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
            SingleChildScrollView(
              child: SizedBox(
                width: ScreenUtil().setWidth(350),
                height: ScreenUtil().setHeight(300),
                child: Card(
                  elevation: 8,
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'loginPhase'.tr,
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        TextFieldWidget(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(290),
                          controller: emailController,
                          prefixIcon: const SizedBox(),
                          hintText: 'email'.tr,
                          isPasswordTextField: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFieldWidget(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(290),
                          controller: passwordController,
                          prefixIcon: const SizedBox(),
                          hintText: 'password'.tr,
                          isPasswordTextField: true,
                          keyboardType: TextInputType.text,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                          alignment: Alignment.topRight,
                          child: Text(
                            'forgotPassword'.tr,
                            style: TextStyle(
                              color: AppColors.fontColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonWidget(
                                width: ScreenUtil().setWidth(40),
                                height: ScreenUtil().setHeight(25),
                                onTap: () {
                                  checkEmail(
                                    emailController.value.text.toString(),
                                    passwordController.value.text.toString(),
                                  );
                                },
                                name: 'signIn'.tr,
                              ),
                              ButtonWidget(
                                width: ScreenUtil().setWidth(40),
                                height: ScreenUtil().setHeight(25),
                                onTap: () {},
                                name: 'signUp'.tr,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void checkEmail(String email, password) {
    component.checkEmailAndPassword(email, password);
  }
}
