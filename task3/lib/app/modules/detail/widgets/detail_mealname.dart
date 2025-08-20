import 'package:flutter/material.dart';
import 'package:task3/app/data/models/item_model.dart';

class DetailMealname extends StatelessWidget {
  final Meal meal;
  const DetailMealname({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            meal.strMeal.toString(),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_outline_sharp),
          ),
        ],
      ),
    );
  }
}
