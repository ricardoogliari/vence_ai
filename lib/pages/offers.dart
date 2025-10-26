import 'package:flutter/material.dart';
import 'package:vence_ai/desygnsystem/colors.dart';
import 'package:vence_ai/models/offer.dart';
import 'package:vence_ai/widgets/va_bottomnavigationbar.dart';
import 'package:vence_ai/widgets/va_filtechip.dart';
import 'package:vence_ai/widgets/va_textfield.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Ofertas',
          style: TextStyle(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: const [
          // Ícone do Carrinho de Compras
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.shopping_cart_outlined, color: primaryTextColor),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SearchBarWidget(),
          ),
          const FiltersRow(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero, // Remove o padding padrão do topo
              itemCount: dummyOffers.length,
              itemBuilder: (context, index) {
                return OfferListItem(offer: dummyOffers[index]);
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: VATextfield(),
    );
  }
}

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
                Text(
                  offer.discount,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor, // Cor de destaque para o desconto
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  offer.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: primaryTextColor,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '${offer.store} - ${offer.distance}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: secondaryTextColor,
                  ),
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
              child: Image.asset(
                offer.imageUrl,
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

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Índice selecionado (Ofertas é 0)
    const int currentIndex = 0;

    return VABottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        // Implementar a lógica de navegação aqui
      },
      items: <BottomNavigationBarItem>[
        // Ofertas (Selecionado)
        BottomNavigationBarItem(
          icon: Icon(Icons.percent_outlined),
          label: 'Ofertas',
        ),
        // Pesquisar
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisar'),
        // Favoritos
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
