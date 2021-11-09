import 'package:cloud_firestore/cloud_firestore.dart';

class GeneralSetting {
  /*final String id;*/
  final int Anonymously;
  final int email;
  final int google;
  final int kullanici_adi;
  final int sms;

  GeneralSetting(
      {/*required this.id,*/
        required this.Anonymously,
        required this.email,
        required this.google,
        required this.kullanici_adi,
        required this.sms,
      });


  /// objeden map oluşturan
  Map<String, dynamic> toMap() {
    return {
      /*"id":id,*/
      'Anonymously': Anonymously,
      'email': email,
      'google': google,
      'kullanici_adi': kullanici_adi,
      'sms': sms,
    };
  }

  /// mapTen obje oluşturan yapıcı
  factory GeneralSetting.fromMap(Map map) {
    return GeneralSetting(
      /*id: map["id"],*/
      Anonymously: map['Anonymously'],
      email: map["email"],
      google: map["google"],
      kullanici_adi: map["kullanici_adi"],
      sms: map["sms"],
    );
  }
}
