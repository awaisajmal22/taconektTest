import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../Common/AppColors/app_color.dart';
import '../../../../Common/AppText/appText.dart';

AppBar appBar({required String title, required VoidCallback voidCallback}) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.whiteFC,
      centerTitle: true,
      title: appText(title: title, fontSize: 20.sp),
      leading: GestureDetector(
        onTap: voidCallback,
        child: const Icon(
          Icons.person,
          color: AppColor.textBlack,
        ),
      ),
    );
  }