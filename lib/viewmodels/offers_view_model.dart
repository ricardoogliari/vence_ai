import 'package:flutter/material.dart';
import 'package:vence_ai/models/offer.dart';
import 'package:vence_ai/repositories/offers_repository.dart';
import 'package:vence_ai/utils/command.dart';
import 'package:vence_ai/utils/result.dart';

class OffersViewmodel extends ChangeNotifier {
  OffersViewmodel({required OffersRepository offersRepository})
    : _offersRepository = offersRepository {
    getHolidays = Command0(_getHolidays)..execute();
  }

  final OffersRepository _offersRepository;

  List<Offer>? _offers;
  List<Offer>? get offers => _offers;

  late final Command0 getHolidays;

  Future<Result> _getHolidays() async {
    try {
      final result = await _offersRepository.fetchOffers();
      switch (result) {
        case Ok<List<Offer>>():
          _offers = result.value;
          print('Loaded user');
        case Error<List<Offer>>():
          print('Failed to load user ${result.error}');
      }

      return result;
    } finally {
      notifyListeners();
    }
  }
}
