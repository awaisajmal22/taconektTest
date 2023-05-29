import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:vaconekttest/RoutesAndBindings/aap_routes.dart';

import '../Model/bottom_sheet_model.dart';

import 'package:firebase_storage/firebase_storage.dart';
import '../Model/user_model.dart';
import 'package:path/path.dart' as path;

class SignupViewModel extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool obsecureText = true.obs;
  RxBool obsecureText2 = true.obs;

  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final formKey = GlobalKey<FormState>();

  RxString imagePath = ''.obs;
  final pickedImage = ImagePicker();
  Future getImageFormCamera() async {
    final selectedImage =
        await pickedImage.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      imagePath.value = selectedImage.path;
    }
  }

  Future getImageFormStorage() async {
    final selectedImage =
        await pickedImage.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      imagePath.value = selectedImage.path;
    }
  }

  List<BottomSheetModel> bottomSheetList = <BottomSheetModel>[
    BottomSheetModel(title: 'Take a photo', leadingIcon: Icons.camera_alt),
    BottomSheetModel(title: 'Your Photo', leadingIcon: Icons.browse_gallery),
    BottomSheetModel(title: 'Delete current photo', leadingIcon: Icons.delete),
  ];
  final auth = FirebaseAuth.instance;

  void createAccount(
      {required File profileImage,
      required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel userModel = UserModel();
    final img = File(imagePath.value);
    Reference storage = await FirebaseStorage.instance.ref().child(
        'profile/[profile-${DateTime.now().microsecondsSinceEpoch.toString()}');
    await storage.putFile(img);
    String imageUrl = await storage.getDownloadURL();

    userModel.image = imageUrl;
    userModel.email = user!.email;
    userModel.firstName = firstName;
    userModel.lastName = lastName;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully :");
    Get.offAllNamed(AppRoutes.loginView);
  }
}
