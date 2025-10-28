import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:vence_ai/models/offer.dart';
import 'package:vence_ai/repositories/location_repository.dart';
import 'package:vence_ai/repositories/offers_repository.dart';
import 'package:vence_ai/utils/result.dart';
import 'package:vence_ai/viewmodels/offers_view_model.dart';

class MockOffersRepository extends Mock implements OffersRepository {}

class MockLocationRepository extends Mock implements LocationRepository {}

void main() {
  group('OffersViewmodel', () {
    late OffersViewmodel viewModel;
    late MockOffersRepository mockOffersRepository;
    late MockLocationRepository mockLocationRepository;

    setUp(() {
      mockOffersRepository = MockOffersRepository();
      mockLocationRepository = MockLocationRepository();
    });

    test(
        'fetches offers and location, calculates distance and discount correctly',
        () async {
      final offers = [
        Offer(
          currentPrice: 80,
          originalPrice: 100,
          store: 'Store A',
          product: 'Product A',
          latitude: -23.5505,
          longitude: -46.6333,
          image: '',
        ),
      ];
      final position = Position(
        latitude: -23.5505,
        longitude: -46.6333,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0,
      );

      when(mockOffersRepository.fetchOffers())
          .thenAnswer((_) async => Ok(offers));
      when(mockLocationRepository.determinePosition())
          .thenAnswer((_) async => Ok(position));

      viewModel = OffersViewmodel(
        offersRepository: mockOffersRepository,
        locationRepository: mockLocationRepository,
      );

      await Future.delayed(Duration.zero); // allow async operations to complete

      expect(viewModel.offers, isNotNull);
      expect(viewModel.offers!.length, 1);
      expect(viewModel.offers![0].discount, '20% OFF');
      expect(viewModel.offers![0].distance, 0);
      expect(viewModel.offers![0].distanceInMeters, '0m');
    });

    test('handles error when fetching offers', () async {
      when(mockOffersRepository.fetchOffers())
          .thenAnswer((_) async => Error(Exception('Failed to fetch offers')));
      when(mockLocationRepository.determinePosition())
          .thenAnswer((_) async => Ok(Position(
                latitude: 0,
                longitude: 0,
                timestamp: DateTime.now(),
                accuracy: 0,
                altitude: 0,
                altitudeAccuracy: 0,
                heading: 0,
                headingAccuracy: 0,
                speed: 0,
                speedAccuracy: 0,
              )));

      viewModel = OffersViewmodel(
        offersRepository: mockOffersRepository,
        locationRepository: mockLocationRepository,
      );

      await Future.delayed(Duration.zero);

      expect(viewModel.offers, isNull);
    });

    test('handles error when fetching location', () async {
      final offers = [
        Offer(
            currentPrice: 80,
            originalPrice: 100,
            store: 'Store A',
            product: 'Product A',
            image: '')
      ];

      when(mockOffersRepository.fetchOffers())
          .thenAnswer((_) async => Ok(offers));
      when(mockLocationRepository.determinePosition()).thenAnswer(
          (_) async => Error(Exception('Failed to fetch location')));

      viewModel = OffersViewmodel(
        offersRepository: mockOffersRepository,
        locationRepository: mockLocationRepository,
      );

      await Future.delayed(Duration.zero);

      expect(viewModel.offers, isNotNull);
      expect(viewModel.offers![0].distance, 0);
      expect(viewModel.offers![0].distanceInMeters, 'N/A');
    });

    test('handles offers without location data', () async {
      final offers = [
        Offer(
            currentPrice: 80,
            originalPrice: 100,
            store: 'Store A',
            product: 'Product A',
            image: '')
      ];
      final position = Position(
        latitude: -23.5505,
        longitude: -46.6333,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0,
      );

      when(mockOffersRepository.fetchOffers())
          .thenAnswer((_) async => Ok(offers));
      when(mockLocationRepository.determinePosition())
          .thenAnswer((_) async => Ok(position));

      viewModel = OffersViewmodel(
        offersRepository: mockOffersRepository,
        locationRepository: mockLocationRepository,
      );

      await Future.delayed(Duration.zero);

      expect(viewModel.offers, isNotNull);
      expect(viewModel.offers!.length, 1);
      expect(viewModel.offers![0].distance, 0);
      expect(viewModel.offers![0].distanceInMeters, 'N/A');
    });
  });
}
