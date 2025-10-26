import 'package:flutter/material.dart';
import 'package:vence_ai/models/offer.dart';

// Cores utilizadas na tela
const Color primaryTextColor = Color(
  0xFF2E2E2E,
); // Preto/Cinza escuro para títulos
const Color secondaryTextColor = Color(0xFF6A6A6A); // Cinza para detalhes
const Color primaryGreen = Color(0xFF38E55A); // Cor principal da BottomNav

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ------------------------------------
      // 1. AppBar
      // ------------------------------------
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

          // Chips de Filtro
          const FiltersRow(),

          // Título da Seção
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Text(
              'Ofertas Próximas',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
                color: primaryTextColor,
              ),
            ),
          ),

          // Lista de Ofertas (ListView)
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

      // ------------------------------------
      // 3. BottomNavigationBar
      // ------------------------------------
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

// ==========================================
// WIDGETS AUXILIARES
// ==========================================

// ------------------------------------
// A. Widget de Barra de Pesquisa (SearchBarWidget)
// ------------------------------------
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0), // Cor de fundo da barra de pesquisa
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Row(
        children: <Widget>[
          Icon(Icons.search, color: secondaryTextColor),
          SizedBox(width: 8.0),
          Text(
            'Pesquisar',
            style: TextStyle(color: secondaryTextColor, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------
// B. Linha de Filtros (Chips)
// ------------------------------------
class FiltersRow extends StatelessWidget {
  const FiltersRow({super.key});

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
            bool isSelected =
                index == 0; // O primeiro chip está selecionado por padrão

            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FilterChip(
                label: Text(categories[index]),
                selected: isSelected,
                onSelected: (bool selected) {
                  // Lógica para lidar com a seleção do chip
                  debugPrint(
                    '${categories[index]} ${selected ? 'selecionado' : 'desselecionado'}',
                  );
                },
                backgroundColor: const Color(
                  0xFFF0FF0F0,
                ), // Fundo não selecionado
                selectedColor: Colors
                    .white, // Fundo selecionado (cor do fundo do Container)
                labelStyle: TextStyle(
                  color: isSelected ? primaryTextColor : secondaryTextColor,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide.none, // Remove a borda padrão
                ),
                // Customização do fundo do primeiro item para parecer o da imagem
                showCheckmark: false,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                // Adiciona uma sombra ou cor de fundo se for o selecionado
                elevation: isSelected ? 2 : 0,
                shadowColor: isSelected ? Colors.black12 : null,
              ),
            );
          },
        ),
      ),
    );
  }
}

// ------------------------------------
// C. Item Individual da Lista de Ofertas (OfferListItem)
// ------------------------------------
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
          // 1. Informações do Texto (Flexível)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Desconto
                Text(
                  offer.discount,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: primaryGreen, // Cor de destaque para o desconto
                  ),
                ),
                const SizedBox(height: 4.0),

                // Título do Produto
                Text(
                  offer.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: primaryTextColor,
                  ),
                ),
                const SizedBox(height: 4.0),

                // Loja e Distância
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

          // 2. Imagem (Container com bordas arredondadas)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: 90.0, // Largura da imagem
              height: 90.0, // Altura da imagem (para torná-la quadrada)
              color: const Color(0xFFE0E0E0), // Placeholder color
              // Substitua pelo seu asset de imagem (necessário configurar no pubspec.yaml)
              child: Image.asset(
                offer.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback para quando o asset não for encontrado
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

// ------------------------------------
// D. BottomNavigationBar (CustomBottomNavBar)
// ------------------------------------
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Índice selecionado (Ofertas é 0)
    const int currentIndex = 0;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      // Define o tipo para 'fixed' para exibir o texto
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 8, // Sombra sutil
      // Cores
      selectedItemColor: primaryGreen,
      unselectedItemColor: secondaryTextColor,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 12),

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
