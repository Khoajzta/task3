import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task3/app/data/models/item_model.dart';

class MealDetailController extends GetxController {
  var meal = Rxn<Meal>();
  var isLoading = false.obs;
  var error = ''.obs;

  Future<void> fetchMealDetail(String idMeal) async {
    try {
      isLoading.value = true;
      error.value = '';

      final url =
          "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$idMeal";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final meals = data['meals'] as List?;
        if (meals != null && meals.isNotEmpty) {
          meal.value = Meal.fromJson(meals[0]);
        } else {
          error.value = "Không tìm thấy món ăn";
        }
      } else {
        error.value = "Lỗi server: ${response.statusCode}";
      }
    } catch (e) {
      error.value = "Lỗi: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
