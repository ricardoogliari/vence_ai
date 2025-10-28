import 'package:mockito/annotations.dart';
import 'package:vence_ai/repositories/location_repository.dart';
import 'package:vence_ai/repositories/offers_repository.dart';

@GenerateMocks([
  OffersRepository,
  LocationRepository,
])
void main() {}
