import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

//Veriyi DateTime-Timestamp-String türlerine çevirme
class Calculator {
  //Datetime to String
  static String dateTimeToString(DateTime dateTime) {
    String formatedDate = DateFormat("dd.MM.yyyy").format(dateTime);
    return formatedDate;
  }

  static Timestamp dateTimeToTimeStamp(DateTime dateTime) {
    //alttaki kodda firebase nin milisaniye şeklinde data alamadığı için farklar oluştuğu söylendi
    // tekrar kontrol edilebilir uzun yolu bir sonraki satır
    // return Timestamp.fromDate(dateTime);
    return Timestamp.fromMicrosecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch);
  }

  static DateTime timeStampToDateTime(Timestamp timestamp){
    return DateTime.fromMicrosecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  }
}
