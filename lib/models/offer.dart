import 'package:json_annotation/json_annotation.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offer {
  @JsonKey(name: 'current_price')
  final double currentPrice;

  @JsonKey(name: 'original_price')
  final double originalPrice;

  double? latitude;
  double? longitude;

  final String product;
  final String store;

  Offer({
    required this.currentPrice,
    required this.originalPrice,
    required this.store,
    required this.product,
    this.latitude,
    this.longitude,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);
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
