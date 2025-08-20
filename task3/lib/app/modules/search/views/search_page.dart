import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task3/app/modules/search/controller/meal_search_controller.dart';
import 'package:task3/app/modules/home/controllers/meal_controller.dart';
import 'package:task3/app/modules/search/widgets/search_card_meal.dart';
import 'package:task3/app/modules/search/widgets/textField_search.dart';
import 'package:task3/app/widgets/bottom_navigationbar.dart';
import 'dart:convert';

class NavController extends GetxController {
  var selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  final MealSearchController mealController = Get.put(MealSearchController());

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1efef),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextfieldSearch(
          controller: _controller,
          focusNode: _focusNode,
          onSearch: (query) {
            mealController.fetchMealByName(query);
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cột
            crossAxisSpacing: 8, // khoảng cách ngang
            mainAxisSpacing: 8, // khoảng cách dọc
            childAspectRatio: 3 / 3.5, // 👈 điều chỉnh tỷ lệ (width / height)
          ),
          itemCount: mealController.meals.length,
          itemBuilder: (context, index) {
            final meal = mealController.meals[index];
            return SearchCardMeal(
              meal: meal,
              author: meal.strCategory.toString(),
              duration: '20m',
              isFavorite: true,
            );
          },
        );
      }),
    );
  }
}
