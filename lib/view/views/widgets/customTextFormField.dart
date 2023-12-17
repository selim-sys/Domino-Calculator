import 'package:domino_calculator/view/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
        required this.label,
        required this.isPassword,
        this.suffixIcon,
        this.validator,
        required this.textInputType,
        this.textEditingController,
        this.suffixPressed,
        this.onFieldSubmitted
      });
  final String label;
  IconData? suffixIcon = CupertinoIcons.eye_slash;
  String? Function(String?)? validator;
  final TextInputType textInputType;
  TextEditingController? textEditingController;
  bool isPassword;
  VoidCallback? suffixPressed;
  void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.whiteColor
      ),
      onFieldSubmitted: onFieldSubmitted,
      obscureText: isPassword,
      controller: textEditingController,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.whiteColor),
              borderRadius: BorderRadius.circular(8.r)
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.whiteColor),
              borderRadius: BorderRadius.circular(8.r)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(8.r),
          ),
          label: Text(label,style: const TextStyle(color: AppColors.whiteColor),),
          contentPadding: EdgeInsets.all(16.w),
          suffixIcon: IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon),)
      ),

    );
  }
}