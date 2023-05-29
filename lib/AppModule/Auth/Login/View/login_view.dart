import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Common/AppAnimation/fade_animation.dart';
import '../../../../Common/AppColors/app_color.dart';
import '../../../../Common/AppText/appText.dart';
import '../../../../Common/AppButtons/app_button.dart';
import '../../../../Common/AppFormFields/custom_form_field.dart';
import '../../../../RoutesAndBindings/aap_routes.dart';
import '../ViewModel/login_view_model.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final loginVM = Get.find<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: loginVM.formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 4.h),
          children: [
            SizedBox(
              height: 10.h,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: FadeAnimation(
                    delay: 2,
                    child: appText(
                        title: 'Login',
                        textColor: AppColor.textBlack,
                        fontSize: 30.sp,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w700))),
            SizedBox(
              height: 2.h,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: FadeAnimation(
                  delay: 2.3,
                  child: appText(
                      title: 'Login with your email.',
                      textColor: AppColor.textGrey,
                      fontSize: 20.sp,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: 2.h,
            ),
            FadeAnimation(
              delay: 2.6,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                // height: SizeConfig.heightMultiplier * 15,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColor.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customFormField(
                        isObsecure: () {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is required";
                          } else if (!loginVM.emailValid.hasMatch(value)) {
                            return 'Please Enter the valid email address';
                          }
                        },
                        suffixIcon: const Icon(null),
                        controller: loginVM.emailController,
                        hintText: 'Email Address'),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 100,
                      color: AppColor.textGrey.withOpacity(0.20),
                    ),
                    Obx(
                      () => customFormField(
                          textInputAction: TextInputAction.done,
                          obsecureText: loginVM.isObsecure.value,
                          isObsecure: () {
                            loginVM.isObsecure.value =
                                !loginVM.isObsecure.value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 5) {
                              return 'Please Enter the valid password';
                            }
                          },
                          suffixIcon: loginVM.isObsecure.value == true
                              ? const Icon(
                                  Icons.visibility,
                                  color: AppColor.textGrey,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: AppColor.textGrey,
                                ),
                          controller: loginVM.passwordController,
                          hintText: 'Password'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            FadeAnimation(
              delay: 2.8,
              child: Align(
                alignment: Alignment.centerRight,
                child: Builder(builder: (context) {
                  return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.resetPasswordView);
                      },
                      child: appText(
                          title: 'Forgot Password?',
                          textColor: AppColor.textGrey,
                          fontSize: 15.sp,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w400));
                }),
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
                    if (loginVM.formKey.currentState!.validate()) {
                      loginVM.loginAccount(
                          email: loginVM.emailController.text,
                          password: loginVM.passwordController.text);
                    }
                  },
                  widget: appText(title: 'Sign In', fontSize: 16.sp)),
            ),
            SizedBox(
              height: 10.h,
            ),
            FadeAnimation(
              delay: 2.8,
              child: Center(
                child: Text.rich(TextSpan(
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                    text: 'You Dont Have Account? ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(AppRoutes.signupView),
                        text: 'SignUp',
                        style: TextStyle(
                            color: AppColor.textGrey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ])),
              ),
            )
          ],
        ),
      )),
    );
  }
}
