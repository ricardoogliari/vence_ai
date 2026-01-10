import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vence_ai/desygnsystem/colors.dart';
import 'package:vence_ai/models/offer.dart';

class OfferListItem extends StatelessWidget {
  final Offer offer;

  const OfferListItem({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(offer.discount ?? '', style: discountText),
                const SizedBox(height: 4.0),
                Text(
                  offer.product,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: primaryTextColor,
                  ),
                ),
                /*const SizedBox(height: 4.0),
                Text(
                  '${offer.store} - ${offer.distanceInMeters}',
                  style: distanceText,
                ),*/
                const SizedBox(height: 4.0),
                Text(
                  'Vencimento: ${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(offer.dueDate))}',
                  style: dueDateText,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: 90.0, // Largura da imagem
              height: 90.0, // Altura da imagem (para torná-la quadrada)
              color: const Color(0xFFE0E0E0), // Placeholder color
              child: Image.memory(
                base64Decode(offer.image),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: secondaryTextColor,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
