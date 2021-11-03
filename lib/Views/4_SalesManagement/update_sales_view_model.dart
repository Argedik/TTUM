import 'package:flutter/material.dart';
import 'package:ttum/Models/sales.dart';
import 'package:ttum/Services/calculater.dart';
import 'package:ttum/Services/database.dart';

class UpdateSalesViewModel extends ChangeNotifier {
  final Database _database = Database();
  String collectionPath = "satis_yonetimi";

  Future<void> updateSales(
      {/*required String id,*/
        required String cari_kodu,
      required String fatura_numarasi,
      required DateTime fatura_tarihi,
      required String fatura_turu,
      required String genel_toplam,
      required String ili,
      required String ticari_unvan,
      required String yetkilisi,
      required Sales sales}) async {
    Sales newSales = Sales(
        cari_kodu: sales.cari_kodu,
        fatura_numarasi: fatura_numarasi,
        fatura_turu: fatura_turu,
        genel_toplam: genel_toplam,
        ili: ili,
        ticari_unvan: ticari_unvan,
        yetkilisi: yetkilisi,
        fatura_tarihi: Calculator.dateTimeToTimeStamp(fatura_tarihi),
        /*id: ''*/);
    await _database.setSalesData(
        collectionPath: collectionPath, salesAsMap: newSales.toMap());
  }
}
