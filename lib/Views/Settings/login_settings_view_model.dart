import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ttum/Models/general_setting.dart';
import 'package:ttum/Services/database.dart';

/*class LoginSettingsViewModel extends ChangeNotifier {
  final Database _database = Database();
  String collectionPath = "genel_ayar";

*/ /*  Future<void> UpdateSecurtySettings({
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
  }*/ /*


  */ /*Stream<List<GeneralSetting>> getSettingList() {
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
  }*/ /*



  Stream<List<GeneralSetting>> getSettingList() {
    // Stream<QuerySnapshot> önce okun sağındakine çeviriyoruz -->
    //Stream<List<DocumentSnapshot
    print("absürt");
    print(FirebaseFirestore.instance.collection(collectionPath).get());
    print(FirebaseFirestore.instance.collection(collectionPath).snapshots());
    print("deneme");

    Stream<QuerySnapshot<Map<String, dynamic>>>
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
      return querySnapshot;
    });
    //Stream<List<DocumentSnapshot>>-->Stream<List<GeneralSetting>>
    Stream<List<GeneralSetting>> streamListSettings = streamListDocument.map(
        (docSnap) => GeneralSetting.fromMap(docSnap.docs.data()))
            .toList());
*/ /*    Stream<List<GeneralSetting>> streamListSettings = streamListDocument.map(
      //listofdocsnap firebaseden ne map ne list olarak geliyor documentsnapshot geliyor
            (listofDocSnap) {
          // print("başlangıc2");
          // print(listofDocSnap);
          // print(listofDocSnap[0].data());
          // print(listofDocSnap[0].get);
          // print(listofDocSnap[1].data());
          // print("$listofDocSnap listofdocsnap denemesi");

          return listofDocSnap.map((docSnap) {
            print("başlangıc3");
            print(docSnap);
            print("$docSnap docSnap denemesi");
            print("${docSnap.reference} docSnap denemesi");
            return GeneralSetting.fromMap(docSnap.data());
          }).toList();
        });*/ /*
    print(streamListDocument.length);
    print("${streamListDocument.first} first komudu");
    print(streamListDocument);
    print("absürt2");
    print(streamListSettings);
    return streamListSettings;
  }
}*/

class LoginSettingsViewModel extends ChangeNotifier {
  final Database _database = Database();
  String collectionPath = "genel_ayar";
  String documentPath = "login_setting";

    Future<void> UpdateSettings({
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
    await _database.setDocumentData(
        collectionPath: collectionPath, salesAsMap: newSettings.toMap(), documentPath: documentPath);

  }




  Stream<GeneralSetting> getSettingList() {
    CollectionReference<Map<String, dynamic>> deneme =
        FirebaseFirestore.instance.collection(collectionPath);
    /*print(deneme.doc().runtimeType);
    print(deneme.doc());
    print(deneme.snapshots().runtimeType);
    print(deneme.doc().snapshots().runtimeType);
    print("map denemesi");
    print(deneme.snapshots());
    print(deneme.doc("login_setting").snapshots());*/
    var ads = deneme.doc("login_setting").snapshots().map((val) {
      return val.data();
    });
    var denemeler = ads.toList();/*
    print(denemeler);
    print(ads.first);
    print("${denemeler} list çevirme");
    print(ads.runtimeType);
    print("collection  denemeleri bitti");*/
    // Stream<QuerySnapshot> önce okun sağındakine çeviriyoruz -->
    //Stream<List<DocumentSnapshot

    Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
        streamListDocument = FirebaseFirestore.instance
            .collection("genel_ayar")
            .snapshots()
            .map((querySnapshot) {
/*
      print("absürt");

      print(querySnapshot.docs);
      print(querySnapshot.docs.runtimeType);
*/

      return querySnapshot.docs;
    });

    //Stream<List<DocumentSnapshot>>-->Stream<List<GeneralSetting>>

    Stream<List<GeneralSetting>> streamListSettings = streamListDocument.map(
        (listofDocSnap) {
      return listofDocSnap.map((docSnap) {
        return GeneralSetting.fromMap(docSnap.data());
      }).toList();
    });

    var denemehe =
        ads.map((docSnap) {
          // print(docSnap);
          return GeneralSetting.fromMap(docSnap!);
        });
    var denemehe2 =
    denemehe.map((doc)async {
      // print(doc);
      await doc;
    });

/*    print("0000000000000000");
    print(denemehe2);
    print("***************");
    print(denemehe);
    print(denemehe);
    print(denemehe.first);
    print(denemehe.toList());
    print(denemehe.runtimeType);
    print("***************************************");
    print(streamListDocument);
    print(streamListSettings);
    print(streamListSettings.runtimeType);
    print("bitiyor");*/

    return denemehe;
    // return streamListSettings;
  }
}
