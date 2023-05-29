import 'dart:convert';

import '../../Network/api_url.dart';
import '../Model/home_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<Map<String, dynamic>> getNewsData() async {
    try {
      var response = await http.get(Uri.parse(ApiUrl.apiUrl));
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        print(result);

        return result;
      } else {
        throw Exception('No Result Found');
      }
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
}
