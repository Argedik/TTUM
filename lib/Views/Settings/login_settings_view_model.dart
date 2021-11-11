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


  Stream<List<GeneralSetting>> getSettingList() {
    // Stream<QuerySnapshot> önce okun sağındakine çeviriyoruz -->
    //Stream<List<DocumentSnapshot
    print("absürt");
    print(FirebaseFirestore.instance.collection(collectionPath).get());
    print("deneme");
    Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
    streamListDocument = FirebaseFirestore.instance.collection("genel_ayar").snapshots()
        .map((querySnapshot) => querySnapshot.docs);
    //Stream<List<DocumentSnapshot>>-->Stream<List<GeneralSetting>>
    Stream<List<GeneralSetting>> streamListSettings = streamListDocument.map(
      //listofdocsnap firebaseden ne map ne list olarak geliyor documentsnapshot geliyor
            (listofDocSnap) => listofDocSnap
            .map((docSnap) => GeneralSetting.fromMap(docSnap.data()))
            .toList());
    print(streamListDocument.length);
    print(streamListDocument.first);
    print(streamListDocument);

    print("absürt2");
    print(streamListSettings);
    return streamListSettings;
  }

}
