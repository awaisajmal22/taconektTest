import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../Common/AppAnimation/fade_animation.dart';
import '../../../../Common/AppButtons/app_button.dart';
import '../../../../Common/AppColors/app_color.dart';
import '../../../../Common/AppFormFields/custom_form_field.dart';
import '../../../../Common/AppText/appText.dart';
import '../ViewModel/signup_view_model.dart';
import '../../../../Common/BottomSheet/image_picker_bottom_sheet.dart';
import '../../../../Common/ImageTile/pic_tile.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final signupVM = Get.find<SignupViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: signupVM.formKey,
                child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.h),
                    children: [
                      SizedBox(
                        height: 6.h,
                      ),
                      FadeAnimation(
                        delay: 2,
                        child: Center(
                          child: Obx(
                            () => picTile(
                                imageUrl: signupVM.imagePath.value,
                                voidCallback: () {
                                  imagePickerBottomSheet(
                                      data: signupVM.bottomSheetList,
                                      fromGallery: () {
                                        signupVM.getImageFormStorage();
                                      },
                                      fromCamera: () {
                                        signupVM.getImageFormCamera();
                                      },
                                      delete: () {
                                        // signupVM.deleteImage();
                                      });
                                }),
                          ),
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
                              title: 'Create Account',
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
                              title: 'Create a new account with your email',
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
                                  controller: signupVM.firstNameController,
                                  hintText: 'First Name'),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width * 100,
                                color: AppColor.textGrey.withOpacity(0.20),
                              ),
                              customFormField(
                                  isObsecure: () {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Your Last Name';
                                    }
                                  },
                                  suffixIcon: const Icon(null),
                                  controller: signupVM.lastNameController,
                                  hintText: 'Last Name'),
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email address';
                                } else if (!signupVM.emailValid
                                    .hasMatch(value)) {
                                  return 'Please enter the valid email address';
                                }
                              },
                              suffixIcon: const Icon(null),
                              controller: signupVM.emailController,
                              hintText: 'Email Address'),
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
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customFormField(
                                    obsecureText: signupVM.obsecureText.value,
                                    isObsecure: () {
                                      signupVM.obsecureText.value =
                                          !signupVM.obsecureText.value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password is required';
                                      } else if (value.length < 4) {
                                        return 'Please enter valid Password';
                                      }
                                    },
                                    suffixIcon:
                                        signupVM.obsecureText.value == true
                                            ? const Icon(
                                                Icons.visibility,
                                                color: AppColor.textGrey,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: AppColor.textGrey,
                                              ),
                                    controller: signupVM.passwordController,
                                    hintText: 'Password'),
                                Container(
                                  height: 1,
                                  width:
                                      MediaQuery.of(context).size.width * 100,
                                  color: AppColor.textGrey.withOpacity(0.20),
                                ),
                                customFormField(
                                    textInputAction: TextInputAction.done,
                                    obsecureText: signupVM.obsecureText2.value,
                                    isObsecure: () {
                                      signupVM.obsecureText2.value =
                                          !signupVM.obsecureText2.value;
                                    },
                                    validator: (value) {
                                      if (signupVM.passwordController.value !=
                                          signupVM.confirmPasswordController
                                              .value) {
                                        return 'Your Confirm password do not match';
                                      }
                                    },
                                    suffixIcon:
                                        signupVM.obsecureText2.value == true
                                            ? const Icon(
                                                Icons.visibility,
                                                color: AppColor.textGrey,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: AppColor.textGrey,
                                              ),
                                    controller:
                                        signupVM.confirmPasswordController,
                                    hintText: 'Confirm Password'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      FadeAnimation(
                        delay: 2.8,
                        child: appButton(
                            buttonHeight: 6.h,
                            butonWidth: MediaQuery.of(context).size.width * 100,
                            voidCallback: () async {
                              if (signupVM.formKey.currentState!.validate()) {
                                await signupVM.auth
                                    .createUserWithEmailAndPassword(
                                        email: signupVM.emailController.text,
                                        password:
                                            signupVM.passwordController.text)
                                    .then((value) async {
                                  signupVM.createAccount(
                                      profileImage:
                                          File(signupVM.imagePath.value),
                                      email: signupVM.emailController.text,
                                      password:
                                          signupVM.passwordController.text,
                                      firstName:
                                          signupVM.firstNameController.text,
                                      lastName:
                                          signupVM.lastNameController.text);
                                }).catchError((e) {
                                  Fluttertoast.showToast(
                                      msg: 'Something went Wrong');
                                });
                              }
                            },
                            widget: appText(title: 'Sign Up', fontSize: 15.sp)),
                      ),
                    ]))));
  }
}
