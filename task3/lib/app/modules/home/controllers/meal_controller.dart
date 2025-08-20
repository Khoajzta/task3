import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task3/app/data/models/item_model.dart';

class MealController extends GetxController {
  var meals = <Meal>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMealsByLetter('d'); // chỉ lấy theo chữ a
    super.onInit();
  }

  Future<void> fetchMealsByLetter(String letter) async {
    try {
      isLoading(true);

      var url = Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/search.php?f=$letter",
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        print('jdkajdka'+data.toString());
        if (data['meals'] != null) {
          meals.value = (data['meals'] as List)
              .map((e) => Meal.fromJson(e))
              .toList();
        } else {
          meals.clear(); // nếu không có món nào thì clear
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
