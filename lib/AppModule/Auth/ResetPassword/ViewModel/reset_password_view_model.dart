import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../RoutesAndBindings/aap_routes.dart';

class ResetPasswordViewModel extends GetxController {
  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  resetPassword({required String email}) {
    _auth.sendPasswordResetEmail(email: email).then((value) {
      Fluttertoast.showToast(
          msg: 'We have sent you email to recover your Password');
      Get.offAllNamed(AppRoutes.loginView);
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
