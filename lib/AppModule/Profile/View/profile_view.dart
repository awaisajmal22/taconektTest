import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Common/AppAnimation/fade_animation.dart';
import '../../../Common/AppButtons/app_button.dart';
import '../../../Common/AppColors/app_color.dart';
import '../../../Common/AppFormFields/custom_form_field.dart';
import '../../../Common/AppText/appText.dart';
import '../../../Common/BottomSheet/image_picker_bottom_sheet.dart';
import '../../../Common/ImageTile/pic_tile.dart';
import '../ViewModel/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final profileVM = Get.find<ProfileViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: profileVM.formKey,
                child: StreamBuilder<DocumentSnapshot>(
                    stream: profileVM.usersCollection
                        .doc(profileVM.user!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      var userData = snapshot.data as DocumentSnapshot;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.textBlack,
                          ),
                        );
                      }
                      return ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.h, vertical: 2.h),
                          children: [
                            SizedBox(
                              height: 6.h,
                            ),
                            FadeAnimation(
                              delay: 2,
                              child: Center(
                                child: userData['image'].toString().length > 5
                                    ? GestureDetector(
                                        onTap: () {
                                          imagePickerBottomSheet(
                                              data: profileVM.bottomSheetList,
                                              fromGallery: () {
                                                profileVM.getImageFormStorage();
                                              },
                                              fromCamera: () {
                                                profileVM.getImageFormCamera();
                                              },
                                              delete: () {
                                                profileVM.deleteImage(
                                                    userData['image']);
                                              });
                                        },
                                        child: CircleAvatar(
                                            backgroundColor: AppColor.shadow5D,
                                            radius: 50, //width of Avatar
                                            backgroundImage: NetworkImage(
                                                "${userData['image']}")),
                                      )
                                    : GestureDetector(
                                        child: CircleAvatar(
                                          backgroundColor: AppColor.whiteFC,
                                          radius: 50,
                                          backgroundImage: NetworkImage(
                                              'https://cdn-icons-png.flaticon.com/512/2815/2815428.png'),
                                        ),
                                        onTap: () {
                                          print("${userData['image']}");
                                          imagePickerBottomSheet(
                                              data: profileVM.bottomSheetList,
                                              fromGallery: () {
                                                profileVM.getImageFormStorage();
                                              },
                                              fromCamera: () {
                                                profileVM.getImageFormCamera();
                                              },
                                              delete: () {
                                                // profileVM.deleteImage(userData['image']);
                                              });
                                        }),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            FadeAnimation(
                              delay: 2.3,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: appText(
                                    title: 'Profile',
                                    textColor: AppColor.textBlack,
                                    fontSize: 30.sp,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            FadeAnimation(
                              delay: 2.8,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: appText(
                                    title: 'Edit Your Profile',
                                    textColor: AppColor.textGrey,
                                    fontSize: 20.sp,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            FadeAnimation(
                              delay: 2.8,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 2.h),
                                // height: SizeConfig.heightMultiplier * 15,
                                width: MediaQuery.of(context).size.width * 100,
                                decoration: BoxDecoration(
                                    color: AppColor.whiteFC.withOpacity(0.95),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customFormField(
                                        isObsecure: () {},
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter Your First Name';
                                          }
                                        },
                                        suffixIcon: const Icon(null),
                                        controller:
                                            profileVM.firstNameController,
                                        hintText: userData['first name']),
                                    Container(
                                      height: 1,
                                      width: MediaQuery.of(context).size.width *
                                          100,
                                      color:
                                          AppColor.textGrey.withOpacity(0.20),
                                    ),
                                    customFormField(
                                        textInputAction: TextInputAction.done,
                                        isObsecure: () {},
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter Your Last Name';
                                          }
                                        },
                                        suffixIcon: const Icon(null),
                                        controller:
                                            profileVM.lastNameController,
                                        hintText: userData['last name']),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            FadeAnimation(
                              delay: 2.8,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 2.h),
                                // height: SizeConfig.heightMultiplier * 15,
                                width: MediaQuery.of(context).size.width * 100,
                                decoration: BoxDecoration(
                                    color: AppColor.whiteFC.withOpacity(0.95),
                                    borderRadius: BorderRadius.circular(8)),
                                child: customFormField(
                                    isObsecure: () {},
                                    readOnly: true,
                                    validator: (value) {},
                                    suffixIcon: const Icon(null),
                                    controller: profileVM.emailController,
                                    hintText: '${userData['email']}'),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            FadeAnimation(
                              delay: 2.8,
                              child: appButton(
                                  buttonHeight: 6.h,
                                  butonWidth:
                                      MediaQuery.of(context).size.width * 100,
                                  voidCallback: () async {
                                    profileVM.updateData(
                                      firstName: profileVM
                                          .firstNameController.value.text,
                                      lastName: profileVM
                                          .lastNameController.value.text,
                                    );
                                    Get.back();
                                  },
                                  widget: appText(
                                      title: 'update', fontSize: 15.sp)),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            FadeAnimation(
                              delay: 2.8,
                              child: appButton(
                                  buttonHeight: 6.h,
                                  butonWidth:
                                      MediaQuery.of(context).size.width * 100,
                                  voidCallback: () async {
                                    profileVM.signOut();
                                  },
                                  widget: appText(
                                      title: 'Logout', fontSize: 15.sp)),
                            ),
                          ]);
                    }))));
  }
}
