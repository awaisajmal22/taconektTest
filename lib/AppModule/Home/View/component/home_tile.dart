

 import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../Common/AppColors/app_color.dart';
import '../../../../Common/AppText/appText.dart';

Widget homeTile(
      {required BuildContext context,
      required String imageUrl,
      required String subtitle,
      required String title}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: AppColor.textBlack.withOpacity(0.3), blurRadius: 15)
      ], color: AppColor.whiteFC),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 100,
            height: 30.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl.isEmpty
                        ? "https://media.istockphoto.com/id/1323872443/vector/live-breaking-news-can-be-used-as-design-for-television-news-or-internet-media-vector.jpg?s=612x612&w=0&k=20&c=EDELZsKmxHgmgBWPRbxQnRKlMLuJdg4t6e27AGWIKKo="
                        : imageUrl),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.all(3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.5.h,
                ),
                appText(
                    title: title, fontSize: 12.sp, textAlign: TextAlign.left),
                SizedBox(
                  height: 0.5.h,
                ),
                appText(
                    title: subtitle,
                    fontSize: 12.sp,
                    textAlign: TextAlign.left),
              ],
            ),
          )
        ],
      ),
    );
  }
