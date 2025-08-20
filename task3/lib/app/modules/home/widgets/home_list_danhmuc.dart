import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task3/app/modules/home/widgets/home_danhmuc_button.dart';

class HomeListDanhmuc extends StatefulWidget {
  const HomeListDanhmuc({super.key});

  @override
  State<HomeListDanhmuc> createState() => _HomeListDanhmucState();
}

class _HomeListDanhmucState extends State<HomeListDanhmuc> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Danh mục', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Xem tất cả', style: TextStyle(color: Color(0xffCEA700))),
          ],
        ),
        const SizedBox(height: 20),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeDanhmucButton(
                text: 'Danh mục 1',
                textColor: Colors.white,
                buttonColor: Color(0xffCEA700),
                isboder: false,
                click: () {},
              ),

              SizedBox(width: 12),

              HomeDanhmucButton(
                text: 'Danh mục 2',
                textColor: Color(0xff615358),
                buttonColor: Colors.white,
                isboder: true,
                click: () {},
              ),

              SizedBox(width: 12),

              HomeDanhmucButton(
                text: 'Danh mục 3',
                textColor: Color(0xff615358),
                buttonColor: Colors.white,
                isboder: true,
                click: () {},
              ),

              SizedBox(width: 12),

              HomeDanhmucButton(
                text: 'Danh mục 4',
                textColor: Color(0xff615358),
                buttonColor: Colors.white,
                isboder: true,
                click: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
