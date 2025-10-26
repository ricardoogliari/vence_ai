// offers_model.dart
class Offer {
  final String discount;
  final String title;
  final String store;
  final String distance;
  final String imageUrl;

  Offer({
    required this.discount,
    required this.title,
    required this.store,
    required this.distance,
    required this.imageUrl,
  });
}

// Dados de exemplo para preencher a lista
final List<Offer> dummyOffers = [
  Offer(
    discount: '20% OFF',
    title: 'Leite Integral',
    store: 'Supermercado Central',
    distance: '500m',
    imageUrl: 'assets/images/milk.png', // Substitua pelos seus assets
  ),
  Offer(
    discount: '30% OFF',
    title: 'Pão Francês',
    store: 'Padaria do Bairro',
    distance: '300m',
    imageUrl: 'assets/images/bread.png', // Substitua pelos seus assets
  ),
  Offer(
    discount: '15% OFF',
    title: 'Frutas Frescas',
    store: 'Hortifruti da Esquina',
    distance: '200m',
    imageUrl: 'assets/images/fruits.png', // Substitua pelos seus assets
  ),
  Offer(
    discount: '25% OFF',
    title: 'Iogurte Natural',
    store: 'Mercadinho Bom Preço',
    distance: '400m',
    imageUrl: 'assets/images/yogurt.png', // Substitua pelos seus assets
  ),
  // Adicione mais itens conforme necessário
];
