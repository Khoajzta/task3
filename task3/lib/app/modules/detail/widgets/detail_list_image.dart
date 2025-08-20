import 'package:flutter/material.dart';
import 'package:task3/app/data/models/item_model.dart';

class DetailListImage extends StatefulWidget {

  final Meal meal;
  const DetailListImage({super.key, required this.meal});

  @override
  State<DetailListImage> createState() => _DetailListImageState();
}

class _DetailListImageState extends State<DetailListImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemCount: 5,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.meal.strMealThumb.toString(),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
