import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ttum/Models/menues.dart';

import 'package:flutter/services.dart';

//YOUTUBE DROPDOWNLİST DENEMESİ
/*
class MenuesProvider with ChangeNotifier{
  CountryProvider() {
    loadCountries().then((countries) {
      _countries = countries;
      notifyListeners();
    });
  }
  List<Menues> _countries = [];

  List<Menues> get countries => _countries;

  Future loadCountries() async {
    final data = await rootBundle.loadString('assets/country_codes.json');
    final countriesJson = json.decode(data);

    return countriesJson.keys.map<Menues>((code) {
      final json = countriesJson[code];
      final newJson = json..addAll({'code': code.toLowerCase()});

      return Menues.fromJson(newJson);
    }).toList()
      ..sort(Utils.ascendingSort);
  }
}

class Utils {
  static int ascendingSort(Menues c1, Menues c2) =>
      c1.name.compareTo(c2.name);
}
*/
