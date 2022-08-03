import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      final User? user = auth.currentUser;
      final uid = user!.uid;
      print(uid);
      transactionReference.add(
        {
          'id': uid,
          'destination': transaction.destination.toJson(),
          'amountOfTraveler': transaction.amountOfTraveler,
          'selectedSeats': transaction.selectedSeats,
          'insurance': transaction.insurance,
          'refundable': transaction.refundable,
          'vat': transaction.vat,
          'price': transaction.price,
          'grandTotal': transaction.grandTotal,
        },
      );
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      final User? user = auth.currentUser;
      final uid = user!.uid;
      print(uid);
      QuerySnapshot result =
          await transactionReference.where('id', isEqualTo: uid).get();

      List<TransactionModel> transactions = result.docs.map(
        (item) {
          return TransactionModel.fromJson(
              item.id, item.data() as Map<String, dynamic>);
        },
      ).toList();

      return transactions;
    } catch (e) {
      throw e;
    }
  }
}
