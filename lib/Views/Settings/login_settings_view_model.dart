import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ttum/Models/general_setting.dart';
import 'package:ttum/Services/database.dart';

class LoginSettingsViewModel extends ChangeNotifier {
  final Database _database = Database();
  String collectionPath = "genel_ayar";

/*  Future<void> UpdateSecurtySettings({
    required int Anonymously,
    required int email,
    required int google,
    required int kullanici_adi,
    required int sms,
  }) async {

    GeneralSetting newSettings = GeneralSetting(
      Anonymously: Anonymously,
      email: email,
      google: google,
      kullanici_adi: kullanici_adi,
      sms: sms,
    );
    await _database.setSalesData(
        collectionPath: collectionPath, salesAsMap: newSettings.toMap());
    print(_database.setSalesData(
        collectionPath: collectionPath, salesAsMap: newSettings.toMap()));
    print("deneme");
  }*/


  /*Stream<List<GeneralSetting>> getSettingList() {
    // Stream<QuerySnapshot> önce okun sağındakine çeviriyoruz -->
    //Stream<List<DocumentSnapshot
    print("absürt");
    print(FirebaseFirestore.instance.collection(collectionPath).get());
    print(FirebaseFirestore.instance.collection(collectionPath).snapshots());
    print("deneme");

    Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
    streamListDocument = _database.getSnapShots(collectionPath)
        .map((querySnapshot) {
      print(querySnapshot.docs);
      print(querySnapshot.docs[1]);
      print(querySnapshot.docs[1].data());
      print(querySnapshot.docs[1].data()["google"].toString());
      print("docs olmuyor");
      return querySnapshot.docs;
    });
    //Stream<List<DocumentSnapshot>>-->Stream<List<GeneralSetting>>
    Stream<List<GeneralSetting>> streamListSettings = streamListDocument.map(
            (listofDocSnap) => listofDocSnap
            .map((docSnap) => GeneralSetting.fromMap(docSnap.data()))
            .toList());
    print(streamListDocument.length);
    print("${streamListDocument.first} first komudu");
    print(streamListDocument);
    print("absürt2");
    print(streamListSettings);
    return streamListSettings;
  }*/



  Stream<List<GeneralSetting>> getSettingList() {
    // Stream<QuerySnapshot> önce okun sağındakine çeviriyoruz -->
    //Stream<List<DocumentSnapshot
    print("absürt");
    print(FirebaseFirestore.instance.collection(collectionPath).get());
    print(FirebaseFirestore.instance.collection(collectionPath).snapshots());
    print("deneme");

    Stream<QueryDocumentSnapshot<Map<String, dynamic>>>
        streamListDocument = _database.getSnapShots(collectionPath)
            .map((querySnapshot) {
      print(querySnapshot.docs);
      print(querySnapshot.docs.runtimeType);
      print(querySnapshot.docs[1]);
      print(querySnapshot.docs[1].runtimeType);
      print(querySnapshot.docs[1].data());
      print(querySnapshot.docs[1].data().runtimeType);
      print("${querySnapshot.docs[1].data()["google"].toString()} google");
      print("${querySnapshot.docs[1].data()["google"].toString().runtimeType} google");
      print("${querySnapshot.docs[1].data()["google"].runtimeType} google");
      print("docs olmuyor");
      return querySnapshot.docs[1];
    });
    //Stream<List<DocumentSnapshot>>-->Stream<List<GeneralSetting>>
    Stream<List<GeneralSetting>> streamListSettings = streamListDocument.map(
        (docSnap) => GeneralSetting.fromMap(docSnap.data()))
            .toList());
    print(streamListDocument.length);
    print("${streamListDocument.first} first komudu");
    print(streamListDocument);
    print("absürt2");
    print(streamListSettings);
    return streamListSettings;
  }
}
