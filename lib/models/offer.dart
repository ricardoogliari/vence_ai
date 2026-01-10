import 'package:json_annotation/json_annotation.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offer {
  @JsonKey(name: 'current_price')
  final double currentPrice;

  @JsonKey(name: 'original_price')
  final double originalPrice;

  @JsonKey(name: 'due_date')
  final int dueDate;

  String? discount;

  double latitude;
  double longitude;

  double? distance;
  String? distanceInMeters;

  final String product;
  final String store;

  @JsonKey(name: 'image_base64')
  final String image;

  Offer({
    required this.currentPrice,
    required this.originalPrice,
    required this.store,
    required this.product,
    required this.latitude,
    required this.longitude,
    required this.dueDate,
    this.distance,
    this.distanceInMeters,
    this.discount,
    required this.image,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);
}
