import 'package:flutter/material.dart';
import 'package:vence_ai/desygnsystem/colors.dart';

class VAFiltechip extends FilterChip {
  VAFiltechip({
    super.key,
    required super.onSelected,
    super.elevation,
    required String label,
    required bool isSelected,
  }) : super(
         label: Text(label),
         selected: isSelected,
         selectedColor: Colors.black12,
         labelStyle: TextStyle(
           color: isSelected ? primaryTextColor : secondaryTextColor,
           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
         ),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8.0),
           side: BorderSide.none, // Remove a borda padrão
         ),
         // Customização do fundo do primeiro item para parecer o da imagem
         showCheckmark: true,
         padding: const EdgeInsets.symmetric(horizontal: 12.0),
         shadowColor: Colors.black12,
       );
}
