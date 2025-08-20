import 'package:flutter/material.dart';

class DetailDanhgia extends StatefulWidget {
  const DetailDanhgia({super.key});

  @override
  State<DetailDanhgia> createState() => _DetailDanhgiaState();
}

class _DetailDanhgiaState extends State<DetailDanhgia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.star, color: Colors.yellow),
          SizedBox(width: 10),
          Text('4.2'),
          SizedBox(width: 10),
          VerticalDivider(width: 10, color: Colors.grey),
          SizedBox(width: 10),
          Text('120 đánh giá'),
        ],
      ),
    );
  }
}
