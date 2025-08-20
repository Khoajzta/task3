import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task3/app/modules/home/controllers/meal_controller.dart';
import 'package:task3/app/modules/home/widgets/home_card_congthuc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MealController mealController = Get.put(MealController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new, color: Color(0xffCEA700)),
        ),
        title: Center(
          child: Text(
            'Trang cá nhân',
            style: TextStyle(color: Color(0xffCEA700)),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Color(0xffCEA700)),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.account_circle_rounded,
              size: 100,
              color: Color(0xffCEA700),
            ),
            Text(
              'Nguyễn Đình Trọng',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xffCEA700),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Bài viết'),
                      Text(
                        '100',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Container(width: 2, height: 40, color: Colors.grey),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text('Người theo dõi'),
                      Text(
                        '100',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Container(width: 2, height: 40, color: Colors.grey),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text('Theo dõi'),
                      Text(
                        '100',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffCEA700),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text('Follow', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 10),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xfffcffc2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Message',
                    style: TextStyle(color: Color(0xffCEA700)),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Danh sách yêu thích',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Obx(() {
              return SizedBox(
                height: 290, // fix chiều cao cho ListView ngang
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 2 cột
                    crossAxisSpacing: 2, // khoảng cách ngang
                    mainAxisSpacing: 2, // khoảng cách dọc
                    childAspectRatio:
                        3 / 3, // 👈 điều chỉnh tỷ lệ (width / height)
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: mealController.meals.length,
                  itemBuilder: (context, index) {
                    final meal = mealController.meals[index];
                    return Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              meal.strMealThumb.toString(),
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
