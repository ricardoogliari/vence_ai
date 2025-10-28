import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vence_ai/models/offer.dart';
import 'package:vence_ai/repositories/location_repository.dart';
import 'package:vence_ai/repositories/offers_repository.dart';
import 'package:vence_ai/utils/command.dart';
import 'package:vence_ai/utils/result.dart';

class OffersViewmodel extends ChangeNotifier {
  OffersViewmodel({
    required OffersRepository offersRepository,
    required LocationRepository locationRepository,
  }) : _locationRepository = locationRepository,
       _offersRepository = offersRepository {
    getHolidays = Command0(_getHolidays)..execute();
  }

  final OffersRepository _offersRepository;
  final LocationRepository _locationRepository;

  List<Offer>? _offers;
  List<Offer>? get offers => _offers;

  late final Command0 getHolidays;

  Future<Result> _getHolidays() async {
    try {
      Position? position;
      final offers = await _offersRepository.fetchOffers();

      final resultPosition = await _locationRepository.determinePosition();
      switch (resultPosition) {
        case Ok<Position>():
          position = resultPosition.value;
        case Error<Position>():
      }

      switch (offers) {
        case Ok<List<Offer>>():
          for (var offer in offers.value) {
            if (offer.latitude != null &&
                offer.longitude != null &&
                position != null) {
              double distanceInMeters = Geolocator.distanceBetween(
                position.latitude,
                position.longitude,
                offer.latitude!,
                offer.longitude!,
              );
              offer.distance = distanceInMeters / 1000; // Convertendo para km
              offer.distanceInMeters =
                  '${distanceInMeters.toStringAsFixed(0)}m';
            } else {
              offer.distance = 0;
              offer.distanceInMeters = 'N/A';
            }

            offer.discount =
                '${(((offer.originalPrice - offer.currentPrice) / offer.originalPrice) * 100).toStringAsFixed(0)}% OFF';
          }
          _offers = offers.value;
        case Error<List<Offer>>():
      }

      return offers;
    } finally {
      notifyListeners();
    }
  }
}
