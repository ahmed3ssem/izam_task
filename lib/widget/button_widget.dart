import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final String name;

  const ButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(ScreenUtil().setWidth(width), ScreenUtil().setHeight(height)), backgroundColor: AppColors.lightBlue,
        textStyle: const TextStyle(color: AppColors.whiteColor),
      ),
      onPressed: onTap,
      child: Text(
        name,
        style: TextStyle(fontSize: 16.sp),
      ),
    );
  }
}
