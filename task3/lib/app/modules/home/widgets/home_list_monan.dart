import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task3/app/data/models/item_model.dart';
import 'package:task3/app/modules/home/widgets/home_cardMonAn.dart';

class HomeListMonan extends StatefulWidget {
  final List<Meal> meals;
  const HomeListMonan({super.key, required this.meals});

  @override
  State<HomeListMonan> createState() => _HomeListMonanState();
}

class _HomeListMonanState extends State<HomeListMonan> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: 290, // fix chiều cao cho ListView ngang
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.meals.length,
          itemBuilder: (context, index) {
            final meal = widget.meals[index];
            return HomeCardmonan(meal: meal);
          },
        ),
      );
    });
  }
}
