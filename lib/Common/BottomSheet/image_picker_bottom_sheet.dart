import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../AppColors/app_color.dart';
import '../AppText/appText.dart';

imagePickerBottomSheet(
    {required List data,
    VoidCallback? fromCamera,
    VoidCallback? fromGallery,
    VoidCallback? delete}) {
  Get.bottomSheet(
      barrierColor: AppColor.shadow29.withOpacity(0.15),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 3.h),
        height: 38.h,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            color: AppColor.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText(
                title: 'Select Profile photo',
                textColor: AppColor.textBlack,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
            const SizedBox(
              height: 32,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  data.length,
                  (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () {
                              if (index == 0) {
                                fromCamera!();
                              } else if (index == 1) {
                                fromGallery!();
                              } else if (index == 2) {
                                delete!();
                              }
                            },
                            leading: Icon(
                              data[index].leadingIcon,
                              color: AppColor.textBlack,
                            ),
                            title: appText(
                                title: data[index].title,
                                textAlign: TextAlign.left,
                                textColor: AppColor.textBlack,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          index == data.length - 1
                              ? const SizedBox()
                              : Container(
                                  height: 1,
                                  width: 50.w,
                                  color: Colors.grey[100],
                                )
                        ],
                      )),
            )
          ],
        ),
      ));
}
