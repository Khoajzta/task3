import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: selectedIndex == 0
                    ? const Color(0xffCEA700)
                    : Colors.grey,
                size: 32,
              ),
              onPressed: () {
                onItemTapped(0);
                context.go('/home');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search_outlined,
                color: selectedIndex == 1
                    ? const Color(0xffCEA700)
                    : Colors.grey,
                size: 32,
              ),
              onPressed: () {
                onItemTapped(1);
                context.go('/search');
              },
            ),
            const SizedBox(width: 40), // chừa chỗ cho nút "+"
            IconButton(
              icon: Icon(
                Icons.bookmark_outline_sharp,
                color: selectedIndex == 2
                    ? const Color(0xffCEA700)
                    : Colors.grey,
                size: 32,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.person_outlined,
                color: selectedIndex == 3
                    ? const Color(0xffCEA700)
                    : Colors.grey,
                size: 32,
              ),
              onPressed: () {
                onItemTapped(3);
                context.go('/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
