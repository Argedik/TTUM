import 'package:meta/meta.dart';


class Menues{
  List<String> options = [
    "Stok Miktarları",
    "Siparişler",
    "Çek Tahsilatı",
    "Cariş Tediye",
    "Masraf Giriş",
    "Evrak Kayıt",
  ];
  List<String> securty = [
    "Anonim Giriş",
    "Email ile Giriş",
    "Sms ile Giriş",
    "Kullanıcı adı ile Giriş",
    "Google ile Giriş",
  ];
  List<String> securtyDetails = [
    "Anonim Giriş, Herhangi bir giriş kontrolü gerekmez.",
    "Email ile Giriş, Mail onaylı giriş yapılması gerekir.",
    "Sms ile Giriş, Kayıtlı telefon numarasına SMS doğrulama kodu gönderilecektir.",
    "Kullanıcı Girişi, Kullanıcı adı ve şifre ile giriş yapılması gerekir.",
    "Google ile Giriş, Mail onaylı giriş yapılması gerekir.",
  ];
}
//YOUTUBE DROPDOWNLİST DENEMESİ
/*class Menues {
  final String name;
  final String nativeName;
  final String code;

  const Menues({
    required this.name,
    required this.nativeName,
    required this.code,
  });

  factory Menues.fromJson(Map<String, dynamic> json) => Menues(
    name: json['name'],
    code: json['code'],
    nativeName: json['native'],
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Menues &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              nativeName == other.nativeName &&
              code == other.code;

  @override
  int get hashCode => name.hashCode ^ nativeName.hashCode ^ code.hashCode;
}*/



