import 'package:cloud_firestore/cloud_firestore.dart';

class Sales {
  /*final String id;*/
  final String cari_kodu;
  final String fatura_numarasi;
  final Timestamp fatura_tarihi;
  final String fatura_turu;
  final String genel_toplam;
  final String ili;
  final String ticari_unvan;
  final String yetkilisi;

  Sales(
      {/*required this.id,*/
        required this.cari_kodu,
        required this.fatura_numarasi,
        required this.fatura_tarihi,
        required this.fatura_turu,
        required this.genel_toplam,
        required this.ili,
        required this.ticari_unvan,
        required this.yetkilisi});


  /// objeden map oluşturan
  Map<String, dynamic> toMap() {

    return {
      /*"id":id,*/
      'cari_kodu': cari_kodu,
      'fatura_numarasi': fatura_numarasi,
      'fatura_tarihi': fatura_tarihi,
      'fatura_turu': fatura_turu,
      'genel_toplam': genel_toplam,
      'ili': ili,
      'ticari_unvan': ticari_unvan,
      'yetkilisi': yetkilisi,
    };
  }

  /// mapTen obje oluşturan yapıcı
  factory Sales.fromMap(Map map) {
    return Sales(
      /*id: map["id"],*/
      cari_kodu: map['cari_kodu'],
      fatura_numarasi: map['fatura_numarasi'],
      fatura_tarihi: map['fatura_tarihi'],
      fatura_turu: map['fatura_turu'],
      genel_toplam: map["genel_toplam"],
      ili: map["ili"],
      ticari_unvan: map["ticari_unvan"],
      yetkilisi: map["yetkilisi"],
    );
  }
}
