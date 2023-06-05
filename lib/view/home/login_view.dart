import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:izam_task/utils/app_colors.dart';
import 'package:izam_task/widget/button_widget.dart';
import 'package:izam_task/widget/text_field_widget.dart';

import 'login_view_component.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> implements HomeViewComponent{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: ScreenUtil().setWidth(320),
            height: ScreenUtil().setHeight(280),
            child:  Card(
              elevation: 8,
              child:Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('loginPhase'.tr , style: TextStyle(color: AppColors.black , fontSize: 22.sp , fontWeight: FontWeight.bold),),
                    SizedBox(height: ScreenUtil().setHeight(10),),
                    TextFieldWidget(height: ScreenUtil().setHeight(50), width: ScreenUtil().setWidth(250), controller: emailController, prefixIcon: const Icon(Icons.email_outlined), hintText: 'email'.tr, isPasswordTextField: false, keyboardType: TextInputType.emailAddress) ,
                    SizedBox(height: ScreenUtil().setHeight(10),),
                    TextFieldWidget(height: ScreenUtil().setHeight(50), width: ScreenUtil().setWidth(250), controller: passwordController, prefixIcon: const Icon(Icons.lock), hintText: 'password'.tr, isPasswordTextField: true, keyboardType: TextInputType.text),
                    //SizedBox(height: ScreenUtil().setHeight(10),),
                    Container(
                      margin: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
                      alignment: Alignment.topRight,
                      child: Text('forgotPassword'.tr , style: const TextStyle(color: AppColors.black , fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(20),),
                    Container(
                      margin: EdgeInsets.only(right: ScreenUtil().setWidth(10) , left: ScreenUtil().setWidth(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonWidget(width: ScreenUtil().setWidth(60), height: ScreenUtil().setHeight(30), onTap: (){}, name: 'signIn'.tr),
                          ButtonWidget(width: ScreenUtil().setWidth(60), height: ScreenUtil().setHeight(30), onTap: (){}, name: 'signUp'.tr),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
