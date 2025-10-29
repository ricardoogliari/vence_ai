import 'package:flutter/material.dart';
import 'package:vence_ai/desygnsystem/colors.dart';
import 'package:vence_ai/models/offer.dart';
import 'package:vence_ai/repositories/location_repository.dart';
import 'package:vence_ai/repositories/offers_repository.dart';
import 'package:vence_ai/services/db_service.dart';
import 'package:vence_ai/viewmodels/offers_view_model.dart';
import 'package:vence_ai/widgets/va_bottomnavigationbar.dart';
import 'package:vence_ai/widgets/va_filtechip.dart';
import 'package:vence_ai/widgets/va_textfield.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key, required this.viewModel});

  final OffersViewmodel viewModel;

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
            child: ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                return ListView.builder(
                  padding: EdgeInsets.zero, // Remove o padding padrão do topo
                  itemCount: viewModel.offers?.length ?? 0,
                  itemBuilder: (context, index) {
                    return OfferListItem(offer: viewModel.offers![index]);
                  },
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  /*uture<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }*/
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
                const SizedBox(height: 4.0),
                Text(
                  '${offer.store} - ${offer.distanceInMeters}',
                  style: distanceText,
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
              child: Image.network(
                offer.image,
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
