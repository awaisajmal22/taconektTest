import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../RoutesAndBindings/aap_routes.dart';

class LoginViewModel extends GetxController {
  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passValid =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetPasswordEmailController = TextEditingController();
  RxBool isObsecure = true.obs;
  List<FocusNode> pinFocusNodes = List.generate(4, (index) => FocusNode());
  List<TextEditingController> pinControllers =
      List.generate(4, (index) => TextEditingController());
  List<TextEditingController> resetPasswordController =
      List.generate(2, (index) => TextEditingController());
  List<RxBool> resetPasswordIsObsecure = List.generate(2, (index) => true.obs);

  final _auth = FirebaseAuth.instance;
  void loginAccount({required String email, required String password}) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) {
      Get.offAllNamed(AppRoutes.homeView);
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }
}
