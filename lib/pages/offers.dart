import 'package:flutter/material.dart';
import 'package:vence_ai/desygnsystem/colors.dart';
import 'package:vence_ai/elements/custom_bottom_bar.dart';
import 'package:vence_ai/elements/filter_row.dart';
import 'package:vence_ai/elements/offer_list_item.dart';
import 'package:vence_ai/elements/search_bar.dart';
import 'package:vence_ai/models/offer.dart';
import 'package:vence_ai/viewmodels/offers_view_model.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key, required this.viewModel});

  final OffersViewmodel viewModel;

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {

  String filter = "";
  int _indexPage = 0;

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
      body: _page(),
      bottomNavigationBar: CustomBottomNavBar(callback: (index) {
        setState(() {
          _indexPage = index;
        });
      },),
    );
  }

  Widget _page() {
    return switch (_indexPage) {
      0 => _firstPage(),
      1 => _secondPage(),
      _ => _thirdPage()
    };
  }

  Widget _secondPage() => const Center(child: Text('Aguarde...'),);

  Widget _thirdPage() => const Center(child: Text('Aguarde...'),);

  Widget _firstPage() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SearchBarWidget(onChanged: (value) {
          setState(() {
            filter = value;
          });
        },),
      ),
      //const FiltersRow(),
      Expanded(
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, _) {
            if (widget.viewModel.offers == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              List<Offer> filteredOffers = widget.viewModel.offers!.where((element) => element.product.contains(filter),).toList();
              return ListView.builder(
                padding: EdgeInsets.zero, // Remove o padding padrão do topo
                itemCount: filteredOffers.length ?? 0,
                itemBuilder: (context, index) {
                  return OfferListItem(offer: filteredOffers[index]);
                },
              );
            }
          },
        ),
      ),
    ],
  );
}
