import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Common/AppAnimation/fade_animation.dart';
import '../../../../Common/AppButtons/app_button.dart';
import '../../../../Common/AppColors/app_color.dart';
import '../../../../Common/AppFormFields/custom_form_field.dart';
import '../../../../Common/AppText/appText.dart';
import '../ViewModel/reset_password_view_model.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});
  final resetPasswordVM = Get.find<ResetPasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: resetPasswordVM.formKey,
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
                        title: 'Reset Password',
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
                      title: 'Reset Password with your email.',
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
                child: customFormField(
                    isObsecure: () {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      } else if (!resetPasswordVM.emailValid.hasMatch(value)) {
                        return 'Please Enter the valid email address';
                      }
                    },
                    suffixIcon: const Icon(null),
                    controller: resetPasswordVM.emailController,
                    hintText: 'Email Address'),
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
                    if (resetPasswordVM.formKey.currentState!.validate()) {
                      resetPasswordVM.resetPassword(
                          email: resetPasswordVM.emailController.text.toString());
                    }
                  },
                  widget: appText(title: 'Reset', fontSize: 16.sp)),
            ),
          ],
        ),
      ),
    );
  }
}
