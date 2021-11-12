import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ttum/Models/sales.dart';
import 'package:ttum/Services/database.dart';

class SalesAmountViewModel extends ChangeNotifier {
  String collectionPath = "satis_yonetimi";
  Database _database = Database();

  Stream<List<Sales>> getSalesList() {
    Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
        streamListDocument = _database
            .getSnapShots(collectionPath)
            .map((querySnapshot) => querySnapshot.docs);
    Stream<List<Sales>> streamListSales = streamListDocument.map(
        (listofDocSnap) => listofDocSnap
            .map((docSnap) => Sales.fromMap(docSnap.data()))
            .toList());

    return streamListSales;
  }
}
