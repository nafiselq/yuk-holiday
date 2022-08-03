import 'package:airplane/models/destionation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationServices {
  CollectionReference destinationReference =
      FirebaseFirestore.instance.collection('destionations');

  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await destinationReference
          .where('type', isEqualTo: 'recommended')
          .get();

      List<DestinationModel> destinations = result.docs.map(
        (item) {
          return DestinationModel.fromJson(
              item.id, item.data() as Map<String, dynamic>);
        },
      ).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }

  Future<List<DestinationModel>> fetchNewDestinations() async {
    try {
      QuerySnapshot result =
          await destinationReference.where('type', isEqualTo: 'new').get();

      List<DestinationModel> destinations = result.docs.map(
        (item) {
          return DestinationModel.fromJson(
              item.id, item.data() as Map<String, dynamic>);
        },
      ).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
