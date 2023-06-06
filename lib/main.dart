import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:izam_task/view/login/login_view.dart';
import 'package:izam_task/widget/message_widget.dart';
import 'package:provider/provider.dart';
import 'utils/app_colors.dart';
import 'utils/app_setting.dart';
import 'utils/local_strings.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: AppSettings()),
        ],
        child: MaterialApp(
          builder: (context, widget) {
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: GetMaterialApp(
                translations: LocalStrings(),
                locale: const Locale('en', 'US'),
                fallbackLocale: const Locale('en', 'US'),
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                      color: AppColors.primaryColor
                  ),
                ),
                home: const LoginView(),
                scaffoldMessengerKey: MessageWidget.scaffoldMessengerKey,
              ),
            );
          },
        ),
      ),
    );
  }
}