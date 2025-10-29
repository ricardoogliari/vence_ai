import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vence_ai/models/offer.dart';
import 'package:vence_ai/repositories/location_repository.dart';
import 'package:vence_ai/repositories/offers_repository.dart';
import 'package:vence_ai/utils/result.dart';
import 'package:vence_ai/viewmodels/offers_view_model.dart';

import 'offers_view_model_test.mocks.dart';

@GenerateMocks([OffersRepository, LocationRepository])
void main() {
  group('OffersViewmodel', () {
    late OffersViewmodel viewModel;
    late MockOffersRepository mockOffersRepository;
    late MockLocationRepository mockLocationRepository;

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

    Result<List<Offer>> _dummyResultOffer() {
      return Result.ok(offers);
    }

    Result<Position> _dummyResultPosition() {
      return Result.ok(position);
    }

    setUp(() {
      mockOffersRepository = MockOffersRepository();
      mockLocationRepository = MockLocationRepository();
    });

    setUpAll(() {
      provideDummy<Result<List<Offer>>>(_dummyResultOffer());
      provideDummy<Result<Position>>(_dummyResultPosition());
    });

    test(
      'fetches offers and location, calculates distance and discount correctly',
      () async {
        when(
          mockOffersRepository.fetchOffers(),
        ).thenAnswer((_) async => Result.ok(offers));
        when(
          mockLocationRepository.determinePosition(),
        ).thenAnswer((_) async => Result.ok(position));

        viewModel = OffersViewmodel(
          offersRepository: mockOffersRepository,
          locationRepository: mockLocationRepository,
        );

        await Future.delayed(
          Duration.zero,
        ); // allow async operations to complete

        expect(viewModel.offers, isNotNull);
        expect(viewModel.offers!.length, 1);
        expect(viewModel.offers![0].discount, '20% OFF');
        expect(viewModel.offers![0].distance, 0);
        expect(viewModel.offers![0].distanceInMeters, '0m');
      },
    );

    test('handles error when fetching offers', () async {
      when(mockOffersRepository.fetchOffers()).thenAnswer(
        (_) async => Result.error(Exception('Failed to fetch offers')),
      );
      when(mockLocationRepository.determinePosition()).thenAnswer(
        (_) async => Result.ok(
          Position(
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
          ),
        ),
      );

      viewModel = OffersViewmodel(
        offersRepository: mockOffersRepository,
        locationRepository: mockLocationRepository,
      );

      expect(viewModel.offers, isNull);
    });

    test('handles error when fetching location', () async {
      when(
        mockOffersRepository.fetchOffers(),
      ).thenAnswer((_) async => Result.ok(offers));
      when(mockLocationRepository.determinePosition()).thenAnswer(
        (_) async => Result.error(Exception('Failed to fetch location')),
      );

      viewModel = OffersViewmodel(
        offersRepository: mockOffersRepository,
        locationRepository: mockLocationRepository,
      );

      await Future.delayed(Duration.zero);

      expect(viewModel.offers, isNotNull);
      expect(viewModel.offers![0].distance, 0);
      expect(viewModel.offers![0].distanceInMeters, 'N/A');
    });
  });
}
