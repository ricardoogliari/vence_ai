import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vence_ai/pages/offers.dart';
import 'package:vence_ai/pages/welcome.dart';
import 'package:vence_ai/repositories/location_repository.dart';
import 'package:vence_ai/repositories/offers_repository.dart';
import 'package:vence_ai/services/db_service.dart';
import 'package:vence_ai/viewmodels/offers_view_model.dart';

const homePath = '/';
const offersPath = '/offers';

final GoRouter router = GoRouter(
  initialLocation: homePath,
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
        return OffersScreen(
          viewModel: OffersViewmodel(
            offersRepository: OffersRepositoryImpl(service: DBServiceImpl()),
            locationRepository: LocationRepositoryImpl(),
          ),
        );
      },
    ),
  ],
);
