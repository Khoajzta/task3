import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task3/app/modules/home/controllers/meal_controller.dart';
import 'package:task3/app/modules/home/widgets/card_huongdan.dart';
import 'package:task3/app/modules/home/widgets/home_cardMonAn.dart';
import 'package:task3/app/modules/home/widgets/home_card_congthuc.dart';
import 'package:task3/app/modules/home/widgets/home_danhmuc_button.dart';
import 'package:task3/app/modules/home/widgets/home_list_congthuc.dart';
import 'package:task3/app/modules/home/widgets/home_list_danhmuc.dart';
import 'package:task3/app/modules/home/widgets/home_list_monan.dart';
import 'package:task3/app/modules/home/widgets/home_list_nguyenlieu.dart';
import 'package:task3/app/modules/home/widgets/home_listhuongdan.dart';
import 'package:task3/app/modules/home/widgets/home_search.dart';
import 'package:task3/app/widgets/bottom_navigationbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MealController mealController = Get.put(MealController());

  final List<HomeDanhmucButton> danhSachNguyenLieu = [
    HomeDanhmucButton(
      text: 'Danh mục 1',
      textColor: Colors.white,
      buttonColor: Color(0xffCEA700),
      isboder: false,
    ),
    HomeDanhmucButton(
      text: 'Danh mục 1',
      textColor: Color(0xff615358),
      buttonColor: Colors.white,
      isboder: true,
    ),
    HomeDanhmucButton(
      text: 'Danh mục 1',
      textColor: Color(0xff615358),
      buttonColor: Colors.white,
      isboder: true,
    ),
    HomeDanhmucButton(
      text: 'Danh mục 1',
      textColor: Color(0xff615358),
      buttonColor: Colors.white,
      isboder: true,
    ),
    HomeDanhmucButton(
      text: 'Danh mục 1',
      textColor: Color(0xff615358),
      buttonColor: Colors.white,
      isboder: true,
    ),
    HomeDanhmucButton(
      text: 'Danh mục 1',
      textColor: Color(0xff615358),
      buttonColor: Colors.white,
      isboder: true,
    ),
    HomeDanhmucButton(
      text: 'Danh mục 1',
      textColor: Color(0xff615358),
      buttonColor: Colors.white,
      isboder: true,
    ),
    HomeDanhmucButton(
      text: 'Danh mục 1',
      textColor: Color(0xff615358),
      buttonColor: Colors.white,
      isboder: true,
    ),
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = 0;
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
      appBar: AppBar(backgroundColor: Color(0xfff1efef), title: HomeSearch()),

      body: Obx(() {
        if (mealController.isLoading.value) {
          // nếu đang loading
          return const Center(
            child: CircularProgressIndicator(color: Colors.amber),
          );
        } else {
          // nếu đã load xong thì hiển thị body cũ
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề
                  HomeListhuongdan(meals: mealController.meals),

                  const SizedBox(height: 20),

                  HomeListDanhmuc(),

                  const SizedBox(height: 20),

                  HomeListMonan(meals: mealController.meals),

                  SizedBox(height: 20),

                  HomeListCongthuc(meals: mealController.meals),

                  HomeListNguyenlieu(buttons: danhSachNguyenLieu),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
