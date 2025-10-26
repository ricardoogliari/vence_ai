import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vence_ai/models/offer.dart';

class DBServiceImpl extends DBService {
  @override
  Future<List<Offer>> fetchOffers() async {
    //await Future.delayed(const Duration(seconds: 1));

    CollectionReference offers = FirebaseFirestore.instance.collection(
      'offers',
    );
    offers.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        print(doc["product"]);
      }
    });

    return [
      Offer(
        currentPrice: 3.49,
        originalPrice: 4.99,
        latitude: -23.55052,
        longitude: -46.633308,
        product: 'Leite Integral 1L',
        store: 'Supermercado Exemplo',
      ),
    ];
  }
}

abstract class DBService {
  Future<List<Offer>> fetchOffers();
}
