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
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  dueDate: (json['due_date'] as num).toInt(),
  distance: (json['distance'] as num?)?.toDouble(),
  distanceInMeters: json['distanceInMeters'] as String?,
  discount: json['discount'] as String?,
  image: json['image_base64'] as String,
);

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
  'current_price': instance.currentPrice,
  'original_price': instance.originalPrice,
  'due_date': instance.dueDate,
  'discount': instance.discount,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'distance': instance.distance,
  'distanceInMeters': instance.distanceInMeters,
  'product': instance.product,
  'store': instance.store,
  'image_base64': instance.image,
};
