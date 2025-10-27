import 'package:vence_ai/models/offer.dart';
import 'package:vence_ai/services/db_service.dart';
import 'package:vence_ai/utils/result.dart';

class OffersRepositoryImpl implements OffersRepository {
  OffersRepositoryImpl({required this.service});

  final DBService service;

  @override
  Future<Result<List<Offer>>> fetchOffers() async {
    try {
      final resultOffers = await service.fetchOffers();

      if (resultOffers is Error<List<Offer>>) {
        return Result.error(Exception('Error fetching offers'));
      }
      return Result.ok(resultOffers);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

abstract class OffersRepository {
  Future<Result<List<Offer>>> fetchOffers();
}
