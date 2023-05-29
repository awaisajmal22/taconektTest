import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../AppColors/app_color.dart';


Widget customFormField(
    {required TextEditingController controller,
    required String hintText,
    TextInputType keyBoeardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    Icon? suffixIcon,
    bool obsecureText = false,
    VoidCallback? isObsecure,
    Function(String?)? validator,
    bool readOnly = false,
    int maxLines = 1}) {
  return TextFormField(
    readOnly: readOnly,
    maxLines: maxLines,
    validator: validator as String? Function(String?),
    obscureText: obsecureText,
    keyboardType: keyBoeardType,
    textInputAction: textInputAction,
    cursorColor: AppColor.textBlack,
    controller: controller,
    style: TextStyle(
        color: AppColor.textBlack,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500),
    decoration: InputDecoration(
        suffixIcon: GestureDetector(onTap: isObsecure, child: suffixIcon),
        contentPadding: EdgeInsets.symmetric(vertical: 2.h),
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColor.textBlack,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400),
        border: InputBorder.none,
        fillColor: AppColor.whiteFC.withOpacity(0.95),
        filled: true,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none),
  );
}
