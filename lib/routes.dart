import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vence_ai/pages/offers.dart';
import 'package:vence_ai/pages/welcome.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: '/offers',
      builder: (BuildContext context, GoRouterState state) {
        return const OffersScreen();
      },
    ),
  ],
);
