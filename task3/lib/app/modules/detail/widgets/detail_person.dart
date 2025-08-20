import 'package:flutter/material.dart';

class DetailPerson extends StatelessWidget {
  const DetailPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.person, color: Colors.grey, size: 32),
          SizedBox(width: 10),
          Text(
            'Đinh Trọng Phúc',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffCEA700),
            ),
          ),
        ],
      ),
    );
  }
}
