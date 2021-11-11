import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Core/colors.dart';
import 'package:ttum/Core/dimensions.dart';
import 'package:ttum/Dao/auth.dart';
import 'package:ttum/Views/1_LoginPage/login.dart';
import 'package:ttum/Views/1_LoginPage/login_anonim.dart';
import 'package:ttum/Views/4_SalesManagement/sales_amount.dart';
import 'package:ttum/Views/Settings/login_settings.dart';
import 'package:ttum/Views/Settings/securty.dart';
import 'package:ttum/Views/Settings/menu_settings.dart';

class Ttum extends StatefulWidget {
  const Ttum({Key? key}) : super(key: key);

  @override
  _TtumState createState() => _TtumState();
}

class _TtumState extends State<Ttum> {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    String appbarTitle = "Aktif Varlıklar";
    String appbarSubTitle = "Finans Analizi";
    final CollectionReference cariRef = _database.collection("cari_tanimlari");

    final DocumentReference documentRef = cariRef.doc("0V01QRxAYtOGeFw2aLPQ");

    //double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xffECEAEA),
          child: ListView(
            children:  [
              const SizedBox(
                height: 120,
                child: DrawerHeader(
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      "Tüm Teknoloji Üretim Merkezi",
                      style: TextStyle(color:ttum, fontSize: 19),
                    ),
                  ),
                  decoration: BoxDecoration(color:Color(0xffECEAEA)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(const SettingsPage());
                },
                child: buildContainer(
                    icon: const Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                    title: "Menüler"),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(const salesAmount());
                },
                child: buildContainer(
                    icon: const Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                    title: "Menü Ayarları"),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(const LoginSettings());
                },
                child: buildContainer(
                    icon: const Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                    title: "Giriş Ayarları"),
              ),
              buildContainer(
                  icon: const Icon(
                    Icons.dashboard,
                    color: Colors.white,
                  ),
                  title: "Profil"),
              buildContainer(
                  icon: const Icon(
                    Icons.dashboard,
                    color: Colors.white,
                  ),
                  title: "Hakkında"),
              buildContainer(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: "Çıkış yap"),
            ],
          ),
        ),
      ),
      /*drawer: Drawer(
        child: Container(
          color: Colors.blueAccent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 80,
                child: DrawerHeader(
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      "Tüm Teknoloji Üretim Merkezi",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.blueAccent),
                ),
              ),
            buildContainer(
                  icon: const Icon(
                    Icons.dashboard,
                    color: Colors.white,
                  ),
                  title: "DASHBOARD"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "FIRSAT"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "AKTİVİTE"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "TEKLİF"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "SİPARİŞ"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "İRSALİYE"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "FATURA"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "İNSAN KAYNAKLARI"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "TEKNİK SERVİS"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "ANALİZ"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "FÖYLER"),
              buildContainer(
                  icon: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  title: "SAYIM"),
              buildContainer(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: "AYARLAR"),
            ],
          ),
        ),
      ),*/

      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              Provider.of<Auth>(context, listen: false).signOut();
              Get.off(const LoginWithAnonymously());
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
        title: Column(
          children: [
            Text(appbarTitle),
            Text(
              appbarSubTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.settings,
            ),
          );

        }

        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.3, -1.3),
              end: Alignment(1.3, 1.3),
              colors: [Colors.yellowAccent, Colors.redAccent],
            ),
            border: Border(
              top: BorderSide(color: Colors.orangeAccent),
            ),
          ),

          //padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Center(
            child: ListView.builder(
              padding: const EdgeInsets.all(edgeInsetsAll),
              itemCount: 12,
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
                  color: Colors.blueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: yukseklik * 0.12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "CARİ ALACAK",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "3.935.198,38 TL",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.map,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer({required String title, required Icon icon}) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF416BA9),
        border: Border(
          bottom: BorderSide(
              width: 4.0, style: BorderStyle.solid, color: Color(0xffECEAEA)),
        ),
      ),
      child: SizedBox(
        height: 50,
        child: ListTile(
          leading: Transform.translate(
            offset: const Offset(-8, -5),
            child: icon,
          ),
          /*
              subtitle: Text("Deneme"),
              // üçüncü satır
              isThreeLine: true,
              //ortala
              dense: true,*/
          title: Transform.translate(
            offset: const Offset(-16, -5),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          trailing: Transform.translate(
            offset: const Offset(8, -5),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
