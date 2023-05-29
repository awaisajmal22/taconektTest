import 'package:get/get.dart';
import 'package:vaconekttest/RoutesAndBindings/aap_routes.dart';

import '../AppModule/Auth/Login/View/login_view.dart';
import '../AppModule/Auth/Login/ViewModel/login_view_model.dart';
import '../AppModule/Auth/ResetPassword/View/reset_password_view.dart';
import '../AppModule/Auth/ResetPassword/ViewModel/reset_password_view_model.dart';
import '../AppModule/Auth/SignUp/View/signup_view.dart';
import '../AppModule/Auth/SignUp/ViewModel/signup_view_model.dart';
import '../AppModule/Home/View/home_view.dart';
import '../AppModule/Home/ViewModel/home_view_model.dart';
import '../AppModule/Profile/View/profile_view.dart';
import '../AppModule/Profile/ViewModel/profile_view_model.dart';
import '../AppModule/Splash/View/splash_view.dart';
import '../AppModule/Splash/ViewModel/splash_view_model.dart';

class AppPages {
  static final routes = [
     GetPage(
      name: AppRoutes.splashView,
      transition: Transition.rightToLeft,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashViewModel>(
          () => SplashViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.loginView,
      transition: Transition.rightToLeft,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginViewModel>(
          () => LoginViewModel(),
        );
      }),
      
    ),
    GetPage(
      name: AppRoutes.signupView,
      transition: Transition.rightToLeft,
      page: () => SignupView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignupViewModel>(
          () => SignupViewModel(),
        );
      }),
      
    ),
    GetPage(
      name: AppRoutes.homeView,
      transition: Transition.rightToLeft,
      page: () => HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeViewModel>(
          () => HomeViewModel(),
        );
      }),
      
    ),
    GetPage(
      name: AppRoutes.resetPasswordView,
      transition: Transition.rightToLeft,
      page: () => ResetPasswordView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ResetPasswordViewModel>(
          () => ResetPasswordViewModel(),
        );
      }),
      
    ),
     GetPage(
      name: AppRoutes.profileView,
      transition: Transition.rightToLeft,
      page: () => ProfileView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProfileViewModel>(
          () => ProfileViewModel(),
        );
      }),
      
    ),
  ];
}
