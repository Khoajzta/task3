import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task3/app/data/models/item_model.dart';

class HomeCardmonan extends StatelessWidget {
  final Meal meal;
  const HomeCardmonan({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Thẻ chính (nền vàng nhạt)
          GestureDetector(
            onTap: () {
              context.push('/detail/${meal.idMeal}');
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: 60,
              ), // đẩy xuống để chừa chỗ hình tròn
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xfffcf5d8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text(
                    textAlign: TextAlign.center,
                    meal.strMeal.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5c3d00),
                    ),
                    maxLines: 2, // Giới hạn 2 dòng
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tạo bởi\nTrần Đình Trọng',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Color(0xff5c3d00)),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '20 phút',
                        style: TextStyle(color: Color(0xff5c3d00)),
                      ),
                      Icon(Icons.article_outlined, color: Color(0xff5c3d00)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Ảnh tròn phía trên
          ClipOval(
            child: Image.network(
              meal.strMealThumb.toString(),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
