import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class salesAmount extends StatefulWidget {
  const salesAmount({Key? key}) : super(key: key);

  @override
  _salesAmountState createState() => _salesAmountState();
}

class _salesAmountState extends State<salesAmount> {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final CollectionReference cariRef = _database.collection("satis_yonetimi");
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Column(
          children: const [
            Text("Satış Yönetimi"),
            Text(
              "Satışlar",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
/*          ElevatedButton(
            onPressed: () async {
              DocumentSnapshot documentSnapshot = await documentRef.get();
              Map<String, dynamic>? data2 =
                  documentSnapshot.data() as Map<String, dynamic>?;
              print(data2!["Ili"]);
            },
            child: Text("data"),
          ),*/
          StreamBuilder<QuerySnapshot<Object?>>(
            stream: cariRef.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Bir hata oluştu. Daha sonra tekrar deneyiniz"),
                );
              } else {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<DocumentSnapshot> cariList = snapshot.data!.docs;
                  return Flexible(
                    child: ListView.builder(
                      itemCount: cariList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var veri = cariList[index].data() as Map;
                        return Card(
                          color: Colors.lightBlueAccent,
                          /*child: ListTile(
                            title: Text(veri["cari_kodu"]),
                            subtitle: Text(veri["fatura_numarasi"]),
                            trailing: Text(veri["fatura_turu"]),
                            leading: Text(veri["ticari_unvan"]),
                            dense: true,
                            isThreeLine: true,
                          ),*/
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                    child: Text(veri["ticari_unvan"],style: TextStyle(fontWeight: FontWeight.bold),
                                        softWrap: true, maxLines: 2),
                                    width: 100),
                              ),
                              Divider(color: Colors.blue),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Text(veri["yetkilisi"],
                                        softWrap: true, maxLines: 2),
                                    width: 75,
                                  ),
                                  SizedBox(
                                    child: Text(veri["ili"],
                                        softWrap: true, maxLines: 2),
                                    width: 75,
                                  ),
                                  SizedBox(
                                    child: Text(veri["fatura_tarihi"],
                                        softWrap: true, maxLines: 2),
                                    width: 75,
                                  ),
                                  SizedBox(
                                    child: Text(veri["genel_toplam"],
                                        softWrap: true, maxLines: 2),
                                    width: 75,
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
