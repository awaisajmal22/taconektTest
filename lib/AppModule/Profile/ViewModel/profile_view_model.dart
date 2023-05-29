import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../RoutesAndBindings/aap_routes.dart';
import '../../Auth/SignUp/Model/bottom_sheet_model.dart';
import '../../Auth/SignUp/Model/user_model.dart';
import 'package:path/path.dart' as path;

class ProfileViewModel extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxString image = ''.obs;
  final pickedImage = ImagePicker();
  Future getImageFormCamera() async {
    final selectedImage =
        await pickedImage.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      uploadImage(selectedImage.path);
    }
  }

  Future getImageFormStorage() async {
    final selectedImage =
        await pickedImage.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      uploadImage(selectedImage.path);
    }
  }

  uploadImage(String path) async {
    final img = File(path);
    Reference storage = await FirebaseStorage.instance.ref().child(
        'profile/[profile-${DateTime.now().microsecondsSinceEpoch.toString()}');
    await storage.putFile(img);
    String image = await storage.getDownloadURL();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .update({'image': image});
    Get.back();
  }

  deleteImage(String imageUrl) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .update({'image': ''});
    await FirebaseStorage.instance.refFromURL(imageUrl).delete();
    Get.back();
  }

  List<BottomSheetModel> bottomSheetList = <BottomSheetModel>[
    BottomSheetModel(title: 'Take a photo', leadingIcon: Icons.camera_alt),
    BottomSheetModel(title: 'Your Photo', leadingIcon: Icons.browse_gallery),
    BottomSheetModel(title: 'Delete current photo', leadingIcon: Icons.delete),
  ];
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  updateData({
    required String firstName,
    required String lastName,
  }) async {
    UserModel userModel = UserModel();

    // Reference storage = await FirebaseStorage.instance
    //     .ref()
    //     .child('profile/${path.basename(imageUrl.path)}');
    // await storage.putFile(File(imageUrl.path));
    // String image = await storage.getDownloadURL();
    userModel.firstName = firstName;
    userModel.lastName = lastName;
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      'first name': userModel.firstName,
      'last name': userModel.lastName,
    });
  }

  final auth = FirebaseAuth.instance;
  signOut() async {
    await auth.signOut().whenComplete(() => Get.offAllNamed(AppRoutes.loginView));
  }
}
