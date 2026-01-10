import 'package:flutter/material.dart';
import 'package:vence_ai/widgets/va_textfield.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({super.key, required this.onChanged});

  Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: VATextfield(onChanged: onChanged),
    );
  }
}