import 'package:flutter/widgets.dart';
import 'package:task3/app/modules/home/widgets/home_danhmuc_button.dart';

class HomeListNguyenlieu extends StatefulWidget {
  final List<HomeDanhmucButton> buttons;
  const HomeListNguyenlieu({super.key, required this.buttons});

  @override
  State<HomeListNguyenlieu> createState() => _HomeListNguyenlieuState();
}

class _HomeListNguyenlieuState extends State<HomeListNguyenlieu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nguyên liệu', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 20),

        GridView.count(
          crossAxisCount: 4, // 4 nút 1 hàng
          shrinkWrap: true, // quan trọng khi nằm trong Column/ScrollView
          physics:
              NeverScrollableScrollPhysics(), // dùng scroll của SingleChildScrollView
          mainAxisSpacing: 10, // khoảng cách dọc giữa các hàng
          crossAxisSpacing: 10, // khoảng cách ngang giữa các nút
          childAspectRatio: 2, // tỷ lệ width/height của nút
          children: widget.buttons, // trả về tất cả phần tử
        ),
      ],
    );
  }
}
