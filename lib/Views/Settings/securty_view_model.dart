import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ttum/Models/general_setting.dart';
import 'package:ttum/Services/database.dart';

class SecurityViewModel extends ChangeNotifier {
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
    print(FirebaseFirestore.instance.collection("genel_ayar").doc().get());
    print(FirebaseFirestore.instance.collection("genel_ayar"));
    print(FirebaseFirestore.instance.collection("genel_ayar").doc("login_setting"));
    print("deneme");
    Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
        streamListDocument = FirebaseFirestore.instance
            .collection("genel_ayar")
            .snapshots()
            .map((querySnapshot) {
              print("başlangıc");
      print("${querySnapshot.docs[1]} daedw");
      print("${querySnapshot.docs[1].get.toString()} daedw");
      print("${querySnapshot.docs} daedw");
      print("docs olmuyor");
      return querySnapshot.docs;
    });
    print("olm*************************************");

    //Stream<List<DocumentSnapshot>>-->Stream<List<GeneralSetting>>

    Stream<List<GeneralSetting>> streamListSettings = streamListDocument.map(
        //listofdocsnap firebaseden ne map ne list olarak geliyor documentsnapshot geliyor
        (listofDocSnap) {
          print("başlangıc2");
          print(listofDocSnap);
          print(listofDocSnap[0].data());
          print(listofDocSnap[0].get);
          print(listofDocSnap[1].data());
          print("$listofDocSnap listofdocsnap denemesi");

      return listofDocSnap.map((docSnap) {
        print("başlangıc3");
        print(docSnap);
        print("$docSnap docSnap denemesi");
        print("${docSnap.reference} docSnap denemesi");
        return GeneralSetting.fromMap(docSnap.data());
      }).toList();
    });



    // print("document bitiş");
    // print(streamListDocument.length);
    // print(streamListDocument.first);
    // print(streamListDocument);
    //
    // print("absürt2");
    // print(streamListSettings);
    return streamListSettings;
  }
}
