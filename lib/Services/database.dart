import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ttum/Models/sales.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

/*  Stream<QuerySnapshot<Map<String, dynamic>>> getCariListFromApi(
      String referancePath) {
    return _firestore.collection(referancePath).snapshots();
  }*/
  //Cari güncelleme
  Stream<QuerySnapshot<Map<String, dynamic>>> getSalesListFromApi(
      String referancePath) {
    return _firestore.collection(referancePath).snapshots();
  }

  Future<void> setSalesData(
      {required String collectionPath,
      required Map<String, dynamic> salesAsMap}) async {
    await _firestore
        .collection(collectionPath)
          //istenirse cari kodu olarak id tanımlanabilir
          //.doc(Sales.fromMap(salesAsMap).cari_kodu)
        .doc()
        .set(salesAsMap);
  }

  //Ayar güncelleme

  Stream<QuerySnapshot<Map<String, dynamic>>> getSettingsFromApi(
      String referancePath) {
    return _firestore.collection(referancePath).snapshots();
  }

  Future<void> setSettings(
      {required String collectionPath,
        required Map<String, dynamic> salesAsMap}) async {
    await _firestore
        .collection(collectionPath)
    //istenirse cari kodu olarak id tanımlanabilir
    //.doc(Sales.fromMap(salesAsMap).cari_kodu)
        .doc("login_setting")
        .set(salesAsMap);
  }
}
