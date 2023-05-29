import 'dart:async';

import 'package:get/get.dart';

import '../../../RoutesAndBindings/aap_routes.dart';

class SplashViewModel extends GetxController {
  Timer? timer;

  @override
  void onInit() {
    // TODO: implement onInit
    timer = Timer(const Duration(seconds: 4), () {
      Get.offAllNamed(AppRoutes.loginView);
     });
    super.onInit();
  }
}