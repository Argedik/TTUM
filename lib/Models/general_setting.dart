
import 'package:ttum/Dao/sqflite_database.dart';

class GeneralSetting {
  final String? id;
  final int Anonymously;
  final int email;
  final int google;
  final int kullanici_adi;
  final int sms;

  GeneralSetting({
    this.id,
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
      //toMap mapinin her elemanına objeden değerler atanıyor
      'Anonymously': Anonymously,
      'email': email,
      'google': google,
      'kullanici_adi': kullanici_adi,
      'sms': sms,
    };
  }

  /// mapTen GeneralSettings objesi oluşturan yapıcı
  ///itemObject =Item(title: itemAsMap["title"], isDone: itemAsMap["isDone"]);
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



  Map<String, dynamic> fromSqfliteToMap(){
    return{
      SqFlite.columnId : id,
      SqFlite.columnAnonymously: Anonymously,
      SqFlite.columnEmail: email,
      SqFlite.columnGoogle: google,
      SqFlite.columnUserName: kullanici_adi,
      SqFlite.columnSms: sms,
    };
  }
  factory GeneralSetting.fromSqFliteMap(Map map){
    return GeneralSetting(
      id: map["columnId"],
      Anonymously: map['columnAnonymously'],
      email: map["columnEmail"],
      google: map["columnGoogle"],
      kullanici_adi: map["columnUserName"],
      sms: map["columnSms"],
    );
  }
}
