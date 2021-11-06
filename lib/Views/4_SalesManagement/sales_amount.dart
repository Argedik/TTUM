import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Models/cari.dart';
import 'package:ttum/Models/sales.dart';
import 'package:ttum/Views/4_SalesManagement/add_sales_amount.dart';
import 'package:ttum/Views/4_SalesManagement/sales_amount_view_model.dart';
import 'package:ttum/Views/4_SalesManagement/update_sales.dart';

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
    return ChangeNotifierProvider<SalesAmountViewModel>(
      create: (BuildContext context) => SalesAmountViewModel(),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Column(
            children: const [
              Text("Fatura Raporu"),
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
            StreamBuilder<List<Sales>>(
              stream: Provider.of<SalesAmountViewModel>(context, listen: false)
                  .getSalesList(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(
                    child: Text("Bir hata oluştu. Daha sonra tekrar deneyiniz"),
                  );
                } else {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Sales?> salesList = snapshot.data!;
                    return BuildListView(salesList: salesList);
                  }
                }
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Get.to(const AddSalesAmount());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({
    Key? key,
    required this.salesList,
  }) : super(key: key);

  final List<Sales?> salesList;

  @override
  State<BuildListView> createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  bool isFiltering = false;
  late List<Sales?> filteredList;

  @override
  Widget build(BuildContext context) {
    var fullList = widget.salesList;
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              onChanged: (query) {
                if (query.isNotEmpty) {
                  isFiltering = true;

                  setState(() {
                    filteredList = fullList
                        .where((sale) => sale!.ticari_unvan
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  });
                } else {
                  //arama yerini silerken klavye kaybolur
                  WidgetsBinding.instance!.focusManager.primaryFocus!.unfocus();
                  setState(() {
                    isFiltering = false;
                  });
                }
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Arama: Ticari ünvan",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0))),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: isFiltering ? filteredList.length : fullList.length,
              itemBuilder: (BuildContext context, int index) {
                var list = isFiltering ? filteredList : fullList;
                // var veri = salesList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpdateSales(sales: list[index]!)));
                  },
                  child: Card(
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
                              child: Text(list[index]!.ticari_unvan,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                  maxLines: 2),
                              width: 100),
                        ),
                        Divider(color: Colors.blue),
                        Row(
                          children: [
                            SizedBox(
                              child: Text(list[index]!.yetkilisi,
                                  softWrap: true, maxLines: 2),
                              width: 75,
                            ),
                            SizedBox(
                              child: Text(list[index]!.ili,
                                  softWrap: true, maxLines: 2),
                              width: 75,
                            ),
                            /*SizedBox(
                              child: Text(salesList[index]!.fatura_tarihi,
                                  softWrap: true, maxLines: 2),
                              width: 75,
                            ),*/
                            SizedBox(
                              child: Text(list[index]!.genel_toplam,
                                  softWrap: true, maxLines: 2),
                              width: 75,
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
