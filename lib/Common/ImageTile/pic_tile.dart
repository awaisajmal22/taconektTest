import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../AppColors/app_color.dart';

Widget picTile({required String imageUrl, required VoidCallback voidCallback}) {
  return GestureDetector(
    onTap: voidCallback,
    child: SizedBox(
      height: 14.h,
      width: 28.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 14.h,
            width: 28.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColor.shadow29.withOpacity(0.15),
                      offset: const Offset(0, 8),
                      blurRadius: 15),
                ],
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.white, width: 4),
                image: imageUrl.isNotEmpty
                    ? DecorationImage(
                        image: FileImage(
                          File(imageUrl),
                        ),
                        fit: BoxFit.cover)
                    : const DecorationImage(
                        image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/2815/2815428.png'),
                        fit: BoxFit.contain)),
          ),
          Positioned(
              right: 20.w,
              child: Container(
                alignment: Alignment.center,
                height: 3.h,
                width: 3.w,
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 3.h,
                  color: AppColor.parrotGreen,
                ),
              ))
        ],
      ),
    ),
  );
}
