import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newmanager/linkapi.dart';

class HomeScreenController extends GetxController {
  var data = [].obs;
  Future<void> updateData(int index, Map<String, dynamic> newData) async {
    final url = Uri.parse(AppLink.product);
    final response = await http.post(
      url,
      body: jsonEncode(newData),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      data[index] = newData;
    } else {
      throw Exception('Failed to update data: ${response.statusCode}');
    }
  }

  goDetail() {
    Get.toNamed('/detail');
  }
}
