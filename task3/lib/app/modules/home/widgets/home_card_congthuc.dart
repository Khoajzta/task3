import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task3/app/data/models/item_model.dart';

class HomeCardCongthuc extends StatelessWidget {
  final Meal meal;

  const HomeCardCongthuc({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/detail/${meal.idMeal}'); // truyền id = 123
      },
      child: Container(
        width: 200,
        padding: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // bo góc 16
              child: Image.network(
                meal.strMealThumb.toString(),

                fit: BoxFit.fill,
              ),
            ),

            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.strMeal.toString(),
                  style: TextStyle(
                    color: Color(0xff734C10),
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2, // Giới hạn 2 dòng
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.account_circle_outlined),
                    SizedBox(width: 10),
                    Text(
                      'Nguyễn Đình Trọng',
                      style: TextStyle(
                        color: Color(0xff002D73),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
