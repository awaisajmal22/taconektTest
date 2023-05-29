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

  Widget homeTile(
      {required BuildContext context,
      required String imageUrl,
      required String subtitle,
      required String title}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: AppColor.textBlack.withOpacity(0.3), blurRadius: 15)
      ], color: AppColor.whiteFC),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 100,
            height: 30.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl.isEmpty
                        ? "https://media.istockphoto.com/id/1323872443/vector/live-breaking-news-can-be-used-as-design-for-television-news-or-internet-media-vector.jpg?s=612x612&w=0&k=20&c=EDELZsKmxHgmgBWPRbxQnRKlMLuJdg4t6e27AGWIKKo="
                        : imageUrl),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.all(3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.5.h,
                ),
                appText(
                    title: title, fontSize: 12.sp, textAlign: TextAlign.left),
                SizedBox(
                  height: 0.5.h,
                ),
                appText(
                    title: subtitle,
                    fontSize: 12.sp,
                    textAlign: TextAlign.left),
              ],
            ),
          )
        ],
      ),
    );
  }
}
