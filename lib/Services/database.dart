import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ttum/Models/sales.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getCariListFromApi(
      String referancePath) {
    return _firestore.collection(referancePath).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSalesListFromApi(
      String referancePath) {
    return _firestore.collection(referancePath).snapshots();
  }

  Future<void> setSalesData(
      {required String collectionPath,
      required Map<String, dynamic> salesAsMap}) async {
    await _firestore
        .collection(collectionPath)
        .doc(Sales.fromMap(salesAsMap).cari_kodu)
        .set(salesAsMap);
  }
}
