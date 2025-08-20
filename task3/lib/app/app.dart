import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:task3/app/modules/detail/views/meal_Detail_page.dart';
import 'package:task3/app/modules/home/views/home_page.dart';
import 'package:task3/app/modules/profile/views/profile_page.dart';
import 'package:task3/app/modules/search/views/search_page.dart';
import 'package:task3/main_page.dart';
import '../app/routes/route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

// GoRouter config
final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomePage()),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: '/detail/:idMeal',
          builder: (context, state) {
            final idMeal = state.pathParameters['idMeal']!;
            return MealDetailPage(idMeal: idMeal);
          },
        ),
      ],
    ),
  ],
);
