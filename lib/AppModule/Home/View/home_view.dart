import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Common/AppColors/app_color.dart';
import '../../../Common/AppText/appText.dart';
import '../../../RoutesAndBindings/aap_routes.dart';
import '../Model/home_model.dart';
import '../ViewModel/home_view_model.dart';
import '../services/home_services.dart';
import 'component/app_bar.dart';
import 'component/home_tile.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final homeVM = Get.find<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: appBar(
              title: 'News',
              voidCallback: () {
                // getNewsData();
                // ApiServices().getNewsData();
                Get.toNamed(AppRoutes.profileView);
              }),
          body: ListView.builder(
            itemCount: homeVM.listOfArticals.length,
            itemBuilder: (context, index) {
              var data = homeVM.listOfArticals[index];
              return homeTile(
                  subtitle: data.description.toString(),
                  context: context,
                  title: data.title.toString(),
                  imageUrl: data.urlToImage.toString());
            },
          ),
        ));
  }

}