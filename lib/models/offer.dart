// offers_model.dart
class Offer {
  final double currentPrice;
  final double originalPrice;
  final double latitude;
  final double longitude;
  final String product;
  final String store;

  Offer({
    required this.currentPrice,
    required this.originalPrice,
    required this.store,
    required this.product,
    required this.latitude,
    required this.longitude,
  });
}

// Dados de exemplo para preencher a lista
final List<Offer> dummyOffers = [
  Offer(
    currentPrice: 100,
    originalPrice: 150,
    store: 'Loja A',
    product: 'Produto X',
    latitude: -23.55052,
    longitude: -46.633308,
  ),
  // Adicione mais itens conforme necessário
];
