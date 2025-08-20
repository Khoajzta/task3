import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:task3/app/modules/home/views/home_page.dart';
import 'package:task3/app/modules/search/views/search_page.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/search',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchPage();
          },
        ),
      ],
    ),
  ],
);
