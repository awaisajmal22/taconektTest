import 'package:get/get.dart';

import '../Model/home_model.dart';
import '../services/home_services.dart';

class HomeViewModel extends GetxController {
  final listOfArticals = <Article>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  loadData() async {
    try {
      final data = await ApiServices().getNewsData();

      final dt = NewsModel.fromJson(data);
      for (var ar in dt.articles!) {
        listOfArticals.add(ar);
      }
    } catch (e) {
      print(e);
    }
  }
}
