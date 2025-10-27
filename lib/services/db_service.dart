import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vence_ai/models/offer.dart';

class DBServiceImpl extends DBService {
  @override
  Future<List<Offer>> fetchOffers() async {
    CollectionReference offers = FirebaseFirestore.instance.collection(
      'offers',
    );
    List<Offer> listOffers = await offers
        .get()
        .then((QuerySnapshot querySnapshot) {
          return querySnapshot.docs.map((doc) {
            Map<String, dynamic> maps = doc.data()! as Map<String, dynamic>;
            Offer offer = Offer.fromJson(maps);

            GeoPoint geoPoint = maps['position'] as GeoPoint;

            offer.latitude = geoPoint.latitude;
            offer.longitude = geoPoint.longitude;

            return offer;
          }).toList();
        })
        .catchError((error) {
          return <Offer>[];
        })
        .onError((error, stackTrace) {
          return <Offer>[];
        });

    return listOffers;
  }
}

abstract class DBService {
  Future<List<Offer>> fetchOffers();
}
