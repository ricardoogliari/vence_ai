import 'package:flutter/material.dart';
import 'package:vence_ai/desygnsystem/colors.dart';

class VATextfield extends StatelessWidget {
  VATextfield({super.key, required this.onChanged});

  Function(String value) onChanged;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: primaryTextColor.withOpacity(0.05),
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Pesquisar',
        hintStyle: TextStyle(color: grey600),
        prefixIcon: Icon(Icons.search, color: grey600),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    ),
  );
}
