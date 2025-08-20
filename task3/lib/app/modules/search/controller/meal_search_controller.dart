import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task3/app/data/models/item_model.dart';

class MealSearchController extends GetxController {
  var meals = <Meal>[].obs;
  var isLoading = true.obs;

  Future<void> fetchMealsByLetter(String letter) async {
    try {
      isLoading(true);

      var url = Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/search.php?f=$letter",
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['meals'] != null) {
          meals.value = (data['meals'] as List)
              .map((e) => Meal.fromJson(e))
              .toList();
        } else {
          meals.clear();
        }
      }
    } finally {
      isLoading(false);
    }
  }

  /// Lấy món ăn theo tên
  Future<void> fetchMealByName(String name) async {
    try {
      isLoading(true);

      var url = Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/search.php?s=$name",
      );

      var response = await http.get(url);

      print("Query: $name");
      print("Raw JSON: ${response.body}");
      print("Meals parse được: ${meals.length}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['meals'] != null) {
          print("API trả về: ${data['meals']}");
          meals.value = (data['meals'] as List)
              .map((e) => Meal.fromJson(e))
              .toList();
          print("Số món parse được: ${meals.length}");
        } else {
          print("Không có món ăn nào");
          meals.clear();
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
