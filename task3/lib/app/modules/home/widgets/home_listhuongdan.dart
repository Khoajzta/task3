import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task3/app/data/models/item_model.dart';
import 'package:task3/app/modules/home/widgets/card_huongdan.dart';

class HomeListhuongdan extends StatefulWidget {
  // Sửa lại cách khai báo biến
  final List<Meal> meals;

  const HomeListhuongdan({
    super.key,
    required this.meals, // Thêm required vì đây là tham số bắt buộc
  });

  @override
  State<HomeListhuongdan> createState() => _HomeListhuongdanState();
}

class _HomeListhuongdanState extends State<HomeListhuongdan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'TP.Hồ Chí Minh',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Xem tất cả', style: TextStyle(color: Color(0xffCEA700))),
          ],
        ),
        const SizedBox(height: 20),
        // Danh sách món ăn (theo chiều ngang)
        SizedBox(
          height: 290,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.meals.length, // Sử dụng widget.meals
            itemBuilder: (context, index) {
              final meal = widget.meals[index]; // Sử dụng widget.meals
              return CardCongthuc(meal: meal);
            },
          ),
        ),
      ],
    );
  }
}
