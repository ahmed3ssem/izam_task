import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class TextFieldWidget extends StatefulWidget {

  final double height;
  final double width;
  final TextEditingController controller;
  final Widget prefixIcon;
  final String hintText;
  final bool isPasswordTextField;
  final TextInputType keyboardType;

  const TextFieldWidget({super.key,required this.height , required this.width  , required this.controller , required this.prefixIcon , required this.hintText , required this.isPasswordTextField , required this.keyboardType});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height.sp,
      width: widget.width.sp,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: passwordVisible,
        style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.black,
        ),
        decoration: InputDecoration(
          fillColor: AppColors.grey500,
          filled: true,
          suffixIcon: widget.isPasswordTextField ? IconButton(
            icon: Icon(
              passwordVisible
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ) : const SizedBox(),
          hintText: widget.hintText,
          border: InputBorder.none,
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}

