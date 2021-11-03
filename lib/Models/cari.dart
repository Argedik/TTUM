import 'package:cloud_firestore/cloud_firestore.dart';

// import 'borrow_info_model.dart';

class Cari {
  final String id;
  final String ticari_unvan;
  final String cep_telefonu;
  final Timestamp kayit_tarihi;
  final String ili;

  // final List<BorrowInfo> borrows;

  Cari(
      {required this.id,
      required this.ticari_unvan,
      required this.cep_telefonu,
      required this.kayit_tarihi,
      required this.ili});

  /// objeden map oluşturan
  Map<String, dynamic> toMap() {
    ///List<BookInfo> ---> List<Map>

    return {
      'id': id,
      'ticari_unvan': ticari_unvan,
      'cep_telefonu': cep_telefonu,
      'kayit_tarihi': kayit_tarihi,
      'ili': ili,
    };
  }

  /// mapTen obje oluşturan yapıcı
  factory Cari.fromMap(Map map) {
    return Cari(
      id: map['id'],
      ticari_unvan: map['ticari_unvan'],
      cep_telefonu: map['cep_telefonu'],
      kayit_tarihi: map['kayit_tarihi'],
      ili: map["ili"],
    );
  }
}
