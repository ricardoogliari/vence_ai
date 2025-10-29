import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vence_ai/models/offer.dart';
import 'package:vence_ai/pages/offers.dart';
import 'package:vence_ai/viewmodels/offers_view_model.dart';

import 'offers_test.mocks.dart';

@GenerateMocks([OffersViewmodel])
void main() {
  late MockOffersViewmodel mockViewModel;

  final offers = [
    Offer(
      product: 'Product 1',
      store: 'Store 1',
      originalPrice: 10.0,
      currentPrice: 5.0,
      image: 'https://via.placeholder.com/150',
    ),
    Offer(
      product: 'Product 2',
      store: 'Store 2',
      originalPrice: 20.0,
      currentPrice: 10.0,
      image: 'https://via.placeholder.com/150',
    ),
  ];

  setUp(() {
    mockViewModel = MockOffersViewmodel();
  });

  testWidgets('OffersScreen should display offers when view model has data', (
    WidgetTester tester,
  ) async {
    when(mockViewModel.offers).thenReturn(offers);

    // Act
    await tester.pumpWidget(
      MaterialApp(home: OffersScreen(viewModel: mockViewModel)),
    );

    // Assert
    expect(find.text('Ofertas'), findsNWidgets(2));
    expect(find.byType(SearchBarWidget), findsOneWidget);
    expect(find.byType(FiltersRow), findsOneWidget);
    expect(find.byType(OfferListItem), findsNWidgets(2));
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 2'), findsOneWidget);
    expect(find.byType(CustomBottomNavBar), findsOneWidget);
  });

  testWidgets(
    'OffersScreen should display empty state when view model has no data',
    (WidgetTester tester) async {
      // Arrange
      when(mockViewModel.offers).thenReturn([]);

      // Act
      await tester.pumpWidget(
        MaterialApp(home: OffersScreen(viewModel: mockViewModel)),
      );

      // Assert
      expect(find.text('Ofertas'), findsNWidgets(2));
      expect(find.byType(OfferListItem), findsNothing);
    },
  );
}
