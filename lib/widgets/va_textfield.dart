import 'package:flutter/material.dart';
import 'package:vence_ai/desygnsystem/colors.dart';

class VATextfield extends StatelessWidget {
  const VATextfield({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: grey200,
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextField(
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
