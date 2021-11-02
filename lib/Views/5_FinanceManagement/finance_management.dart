import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class financeManagement extends StatefulWidget {
  const financeManagement({Key? key}) : super(key: key);

  @override
  _financeManagementState createState() => _financeManagementState();
}

class _financeManagementState extends State<financeManagement> {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final CollectionReference cariRef = _database.collection("cari_tanimlari");
    final DocumentReference documentRef = cariRef.doc("0V01QRxAYtOGeFw2aLPQ");
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              DocumentSnapshot documentSnapshot = await documentRef.get();
              Map<String, dynamic>? data2 =
                  documentSnapshot.data() as Map<String, dynamic>?;
              print(data2!["Ili"]);
            },
            child: Text("data"),
          ),
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
                          child: ListTile(
                            title: Text(veri["ili"]),
                            subtitle: Text(veri["kayit_tarihi"]),
                            trailing: Text(veri["ticari_unvan"]),
                            leading: Text(veri["cari_kodu"]),
                            dense: true,
                            isThreeLine: true,
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
