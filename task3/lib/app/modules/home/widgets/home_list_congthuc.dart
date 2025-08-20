import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task3/app/data/models/item_model.dart';
import 'package:task3/app/modules/home/widgets/home_card_congthuc.dart';

class HomeListCongthuc extends StatefulWidget {
  final List<Meal> meals;
  const HomeListCongthuc({super.key, required this.meals});

  @override
  State<HomeListCongthuc> createState() => _HomeListCongthucState();
}

class _HomeListCongthucState extends State<HomeListCongthuc> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Công thức gần đây',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 20),
        Obx(() {
          return SizedBox(
            height: 290, // fix chiều cao cho ListView ngang
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.meals.length,
              itemBuilder: (context, index) {
                final meal = widget.meals[index];
                return HomeCardCongthuc(meal: meal);
              },
            ),
          );
        }),
      ],
    );
  }
}
