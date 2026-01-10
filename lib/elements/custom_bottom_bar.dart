import 'package:flutter/material.dart';
import 'package:vence_ai/widgets/va_bottomnavigationbar.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({super.key, required this.callback});

  final Function(int index) callback;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return VABottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        widget.callback.call(index);
        setState(() {
          currentIndex = index;
        });
      },
      items: <BottomNavigationBarItem>[
        // Ofertas (Selecionado)
        BottomNavigationBarItem(
          icon: Icon(Icons.percent_outlined),
          label: 'Ofertas',
        ),
        // Pesquisar
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favoritos',
        ),
        // Perfil
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Perfil',
        ),
      ],
    );
  }
}