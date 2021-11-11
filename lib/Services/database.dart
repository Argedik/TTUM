import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

/*  Stream<QuerySnapshot<Map<String, dynamic>>> getCariListFromApi(
      String referancePath) {
    return _firestore.collection(referancePath).snapshots();
  }*/
  //Cari güncelleme
  Stream<QuerySnapshot<Map<String, dynamic>>> getSnapShots(
      String referancePath) {
    return _firestore.collection(referancePath).snapshots();
  }

  Future<void> setSalesData({
    required String collectionPath,
    required Map<String, dynamic> salesAsMap,
    // String? documentRef
  }) async {
    print("deneme");
    await _firestore
        .collection(collectionPath)
        //istenirse cari kodu olarak id tanımlanabilir
        //.doc(Sales.fromMap(salesAsMap).cari_kodu)
        // .doc(documentRef)
        .doc()
        .set(salesAsMap);
  }

//Ayar güncelleme

/*  Future<void> setSettings({
    required String collectionPath,
    required Map<String, dynamic> salesAsMap,
    DocumentReference<Map<String, dynamic>>? documentRef
  }) async {
    await _firestore
        .collection(collectionPath)
        //istenirse cari kodu olarak id tanımlanabilir
        //.doc(Sales.fromMap(salesAsMap).cari_kodu)
        .doc("login_setting")
        .set(salesAsMap);
  }*/
}
