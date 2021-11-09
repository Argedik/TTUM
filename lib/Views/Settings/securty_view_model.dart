import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ttum/Models/general_setting.dart';
import 'package:ttum/Services/database.dart';

class SecurityViewModel extends ChangeNotifier {
  final Database _database = Database();
  String collectionPath = "genel_ayar";

  Future<void> UpdateSecurtySettings({
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
    await _database.setSettings(
        collectionPath: collectionPath, salesAsMap: newSettings.toMap());
  }

  Stream<List<GeneralSetting>> getSettingList() {
    Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
        streamListDocument = _database
            .getSettingsFromApi(collectionPath)
            .map((querySnapshot) => querySnapshot.docs);
    print(streamListDocument);
    Stream<List<GeneralSetting>> streamListSettings = streamListDocument.map(
        (listofDocSnap) => listofDocSnap
            .map((docSnap) => GeneralSetting.fromMap(docSnap.data()))
            .toList());
    print(streamListSettings);
    return streamListSettings;
  }
}
