import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task3/app/widgets/bottom_navigationbar.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;
  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    // cập nhật selectedIndex theo location
    if (location.startsWith('/home'))
      _selectedIndex = 0;
    else if (location.startsWith('/search'))
      _selectedIndex = 1;
    else if (location.startsWith('/bookmark'))
      _selectedIndex = 2;
    else if (location.startsWith('/profile'))
      _selectedIndex = 3;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget.child,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffCEA700),
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
