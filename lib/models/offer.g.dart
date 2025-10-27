// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
  currentPrice: (json['current_price'] as num).toDouble(),
  originalPrice: (json['original_price'] as num).toDouble(),
  store: json['store'] as String,
  product: json['product'] as String,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
  'current_price': instance.currentPrice,
  'original_price': instance.originalPrice,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'product': instance.product,
  'store': instance.store,
};
