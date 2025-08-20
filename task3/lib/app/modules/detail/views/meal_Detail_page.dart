import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task3/app/modules/detail/controllers/meal_detail_controller.dart';
import 'package:task3/app/modules/detail/widgets/detail_danhgia.dart';
import 'package:task3/app/modules/detail/widgets/detail_description.dart';
import 'package:task3/app/modules/detail/widgets/detail_list_image.dart';
import 'package:task3/app/modules/detail/widgets/detail_mealname.dart';
import 'package:task3/app/modules/detail/widgets/detail_person.dart';

class MealDetailPage extends StatefulWidget {
  final String idMeal;
  const MealDetailPage({super.key, required this.idMeal});

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final controller = Get.put(MealDetailController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    // Gọi API ngay khi vào trang
    controller.fetchMealDetail(widget.idMeal);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.error.isNotEmpty) {
              return Center(child: Text(controller.error.value));
            }
            if (controller.meal.value == null) {
              return const Center(child: Text("Không có dữ liệu"));
            }

            final meal = controller.meal.value!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(meal.strMealThumb.toString()),

                    DetailListImage(meal: meal),

                    const SizedBox(height: 16),

                    DetailMealname(meal: meal),

                    DetailDescription(),

                    DetailDanhgia(),

                    DetailPerson(),

                    // TabBar
                    Theme(
                      data: Theme.of(context).copyWith(
                        splashFactory: NoSplash.splashFactory, // tắt ripple
                        highlightColor: Colors.transparent, // tắt highlight
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),
                      child: TabBar(
                        controller: tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(12), // bo góc
                          color: Color(0xffCEA700),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Color(0xffCEA700),
                        indicatorPadding: const EdgeInsets.symmetric(
                          horizontal: 1,
                          vertical: 6,
                        ),
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                              ), // padding text
                              child: Text("Nguyên liệu"),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                              ),
                              child: Text("Chế biến"),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Nội dung TabBarView
                    SizedBox(
                      height: 400, // cần set chiều cao cho TabBarView
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          // Tab 1: Nguyên liệu
                          ListView(
                            padding: const EdgeInsets.all(16),
                            children: [
                              const Text(
                                'Dành cho 2-4 người ăn',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 10),

                              // render nguyên liệu
                              ...meal.getIngredients().map(
                                (ingredient) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    "• $ingredient",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: const Text(
                                  'Đối với bột gia vị',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),

                              ...meal.getstrMeasure().map(
                                (ingredient) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    "• $ingredient",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Tab 2: Cách chế biến
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              textAlign: TextAlign.justify,
                              meal.strInstructions ?? "Không có hướng dẫn",
                              style: const TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xfffcffc2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 50,
                        alignment: Alignment.center,

                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.ondemand_video_rounded,
                              color: Color(0xffCEA700),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Xem video',
                              style: TextStyle(color: Color(0xffCEA700)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ),
                Text('Chi tiết', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
