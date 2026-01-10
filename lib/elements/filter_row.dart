import 'package:flutter/material.dart';
import 'package:vence_ai/widgets/va_filtechip.dart';

class FiltersRow extends StatefulWidget {
  const FiltersRow({super.key});

  @override
  State<FiltersRow> createState() => _FiltersRowState();
}

class _FiltersRowState extends State<FiltersRow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Lista de categorias/chips
    final List<String> categories = [
      'Alimentos',
      'Bebidas',
      'Higiene',
      'Limpeza',
      'Outros',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 40.0, // Altura fixa para a linha de chips
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: VAFiltechip(
                label: categories[index],
                isSelected: selectedIndex == index,
                onSelected: (bool selected) {
                  setState(() {
                    selectedIndex = index;
                  });
                }, // Fundo não selecionado
              ),
            );
          },
        ),
      ),
    );
  }
}
