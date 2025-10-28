import 'package:flutter/material.dart';
import 'package:vence_ai/desygnsystem/colors.dart';

class VABottomNavigationBar extends BottomNavigationBar {
  VABottomNavigationBar({
    super.key,
    super.currentIndex,
    required Function(int) onTap,
    required List<BottomNavigationBarItem> items,
  }) : super(
         // Define o tipo para 'fixed' para exibir o texto
         type: BottomNavigationBarType.fixed,
         selectedItemColor: primaryTextColor,
         unselectedItemColor: secondaryTextColor,
         selectedLabelStyle: const TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 12,
         ),
         unselectedLabelStyle: const TextStyle(fontSize: 12),
         onTap: (index) {
           onTap(index).call();
         },
         items: items,
       );
}
