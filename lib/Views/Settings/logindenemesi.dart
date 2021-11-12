import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Core/colors.dart';
import 'package:ttum/Core/dimensions.dart';
import 'package:ttum/Models/appbar.dart';
import 'package:ttum/Models/general_setting.dart';
import 'package:ttum/Models/menues.dart';
import 'package:ttum/Views/Settings/securty_view_model.dart';

class LoginSettingsdenemes extends StatefulWidget {
  const LoginSettingsdenemes({Key? key}) : super(key: key);

  @override
  _LoginSettingsdenemesState createState() => _LoginSettingsdenemesState();
}

class _LoginSettingsdenemesState extends State<LoginSettingsdenemes> {
  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(Menues().securty.length, false);
    // print(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    final DocumentReference<Map<String, dynamic>> _loginStream = FirebaseFirestore.instance.collection('genel_ayar').doc("login_setting");
    final Stream<QuerySnapshot<Map<String, dynamic>>> _loginStream2 = FirebaseFirestore.instance.collection('genel_ayar').snapshots();

    var height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<SecurityViewModel>(
      create: (BuildContext context) => SecurityViewModel(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: ttum,
          title: AppBarTitle(
            appBarTitle: 'Giriş Ayarları',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: height * 2,
            decoration: const BoxDecoration(
              color: Colors.grey,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffffffff),
                  Color(0xffa5acde),
                  Color(0xff6f78d2),
                  Color(0xff5059c7)
                ],
                stops: [0.0, 0.318, 0.657, 1.0],
              ),
            ),

            // StreamBuilder<List<Sales>>(
            //   stream: Provider.of<SalesAmountViewModel>(context, listen: false)
            //       .getSalesList(),
            //   builder: (BuildContext context, snapshot) {
            //     if (snapshot.hasError) {
            //       print(snapshot.error);
            //       return const Center(
            //         child: Text("Bir hata oluştu. Daha sonra tekrar deneyiniz"),
            //       );
            //     } else {
            //       if (!snapshot.hasData) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else {
            //         List<Sales?> salesList = snapshot.data!;
            //         return BuildListView(salesList: salesList);
            //       }
            //     }
            //   },
            // ),
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:_loginStream2,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  print("data verisi");
                  print(snapshot.data);
                  print(snapshot.error);
                  return const Center(
                    child: Text("Bir hata oluştu. Daha sonra tekrar deneyiniz"),
                  );
                } else {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    //         return BuildListView(salesList: salesList);
                    // QuerySnapshot salesList = snapshot.data!;
                    /*print(salesList);
                    print(salesList.docs);
                    print(salesList.docs[1].data() as Map);*/
                    /*QuerySnapshot salesList = snapshot.data!;
                    var c = salesList.docs[1].data() as Map;
                    var b;
                    var a=0;
                    var d;
                    var e;
                    print("for döngüsü");
                    print(c);
                    c.forEach((key, value) {
                      if(value==1){
                        b = a;
                        d=key;
                      }
                      a++;
                    });
                    print("$d $b");
                    print("***************************");
                    a=0;
                    for (var i in Menues().securty) {
                      print(i.substring(0,i.indexOf(" ")).toLowerCase());
                      i.substring(0,i.indexOf(" ")).toLowerCase()==d?b=a:e=0;
                      print(i);
                      a++;
                    }
                    print("$b");
                    print(Menues().securty);
                    print(d);*/
                    print("login denemeleri");
                    List<DocumentSnapshot> listofdoc=snapshot.data.docs;
                    final List<GeneralSetting?> GeneralList;
                    print(snapshot);
                    print(snapshot.data);
                    print(snapshot.data.docs);
                    print(snapshot.data.docs.length);
                    print(listofdoc.length);
                    print(listofdoc[0].data());
                    return ListView.builder(
                      padding: const EdgeInsets.all(edgeInsetsAll),
                      itemCount: Menues().securty.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          //kod dışarı taşmasın clip.antialias
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.all(edgeInsetsAll),
                          borderOnForeground: true,
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          semanticContainer: true,
                          color: ttum,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //checkbox
                              Expanded(
                                flex: 10,
                                child: Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.white),
                                  child: CheckboxListTile(
                                    value: _isChecked[index],
                                    // value: index==b?true:false,
                                    onChanged: (val) async {
                                      setState(
                                            () {
                                          /*_isChecked[index] = val!;
                                          Get.to(Ttum());*/
                                          //_isChecked[index] = val!;
                                          var a = 0;
                                          for (var i in _isChecked) {
                                            _isChecked[a] = false;
                                            a++;
                                          }
                                          _isChecked[index] = true;
                                        },
                                      );
                                      var a = 0;
                                      List<int> b = [];
                                      for (var i in _isChecked) {
                                        _isChecked[a] == false
                                            ? b.add(0)
                                            : b.add(1);
                                        print(b);
                                        a++;
                                      }
/*                                      await context
                                          .read<SecurityViewModel>()
                                          .UpdateSecurtySettings(
                                            Anonymously: b[0],
                                            email: b[1],
                                            sms: b[2],
                                            kullanici_adi: b[3],
                                            google: b[4],
                                          );*/
                                    },
                                  ),
                                ),
                              ),
                              //text
                              Expanded(
                                flex: 30,
                                child: SizedBox(
                                  height: height * 0.12,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        Menues().securty[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //sondaki icon
                              Expanded(
                                flex: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    var detay = Menues().securtyDetails[index];
                                    Get.defaultDialog(
                                      title: detay.substring(
                                          0, detay.indexOf(",")),
                                      backgroundColor: ttum,
                                      titleStyle:
                                      TextStyle(color: Colors.white),
                                      middleTextStyle:
                                      TextStyle(color: Colors.white),
                                      middleText: detay.substring(
                                          detay.indexOf(",") + 2, detay.length),
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                    child: const Icon(
                                      IconData(983233,
                                          fontFamily: 'MaterialIcons'),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
