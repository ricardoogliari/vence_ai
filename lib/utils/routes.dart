import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vence_ai/pages/offers.dart';
import 'package:vence_ai/pages/welcome.dart';

const homePath = '/';
const offersPath = '/offers';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: homePath,
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: offersPath,
      builder: (BuildContext context, GoRouterState state) {
        return const OffersScreen();
      },
    ),
  ],
);
