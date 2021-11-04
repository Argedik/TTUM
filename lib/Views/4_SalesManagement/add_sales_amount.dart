import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Services/calculater.dart';
import 'package:ttum/Views/4_SalesManagement/add_sales_amount_view_model.dart';

class AddSalesAmount extends StatefulWidget {
  const AddSalesAmount({Key? key}) : super(key: key);

  @override
  _AddSalesAmountState createState() => _AddSalesAmountState();
}

class _AddSalesAmountState extends State<AddSalesAmount> {
  TextEditingController cari_kodu = TextEditingController();
  TextEditingController fatura_numarasi = TextEditingController();
  TextEditingController fatura_tarihi = TextEditingController();
  TextEditingController fatura_turu = TextEditingController();
  TextEditingController genel_toplam = TextEditingController();
  TextEditingController ili = TextEditingController();
  TextEditingController ticari_unvan = TextEditingController();
  TextEditingController yetkilisi = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _selectedDate;

  @override
  void dispose() {
    cari_kodu.dispose();
    fatura_numarasi.dispose();
    fatura_tarihi.dispose();
    fatura_turu.dispose();
    genel_toplam.dispose();
    ili.dispose();
    ticari_unvan.dispose();
    yetkilisi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddSalesViewModel>(
      create: (_) => AddSalesViewModel(),
      builder: (context, _) =>
          Scaffold(
            appBar: AppBar(
              title: Column(
                children: const [
                  Text("İşlemler"),
                  Text(
                    "Satış Faturası",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Container(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: cari_kodu,
                        decoration: const InputDecoration(
                            hintText: "Cari Kodu", icon: Icon(Icons.how_to_reg)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Cari kodu boş olamaz";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: fatura_numarasi,
                        decoration: const InputDecoration(
                            hintText: "Fatura Numarası", icon: Icon(Icons.list_alt_outlined)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Fatura numarası boş olamaz";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        onTap: () async {
                          _selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          );
                          fatura_tarihi.text =
                              Calculator.dateTimeToString(_selectedDate!);
                        },
                        controller: fatura_tarihi,
                        decoration: const InputDecoration(
                            hintText: "Fatura Tarihi",
                            icon: Icon(Icons.more_time_outlined)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Fatura Tarihi boş olamaz";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: fatura_turu,
                        decoration: const InputDecoration(
                            hintText: "Fatura türü",
                            icon: Icon(Icons.list_alt_outlined)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Fatura türü boş olamaz";
                          } else {
                            return null;
                          }
                        },
                      ),

                      TextFormField(
                        controller: genel_toplam,
                        decoration: const InputDecoration(
                            hintText: "Genel Toplam",
                            icon: Icon(Icons.add_circle_sharp)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Genel Toplam boş olamaz";
                          } else {
                            return null;
                          }
                        },
                      ),

                      TextFormField(
                        controller: ili,
                        decoration: const InputDecoration(
                            hintText: "İli",
                            icon: Icon(Icons.add_location_sharp)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "İli boş olamaz";
                          } else {
                            return null;
                          }
                        },
                      ),

                      TextFormField(
                        controller: ticari_unvan,
                        decoration: const InputDecoration(
                            hintText: "Ticari Ünvan",
                            icon: Icon(Icons.account_box)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ticari Ünvan boş olamaz";
                          } else {
                            return null;
                          }
                        },
                      ),

                      TextFormField(
                        controller: yetkilisi,
                        decoration: const InputDecoration(
                            hintText: "Yetkilisi",
                            icon: Icon(Icons.account_circle_sharp)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Genel Toplam boş olamaz";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        child: const Text("Kaydet"),
                        onPressed: () async{
                          if (_formKey.currentState!.validate()) {
                            await context.read<AddSalesViewModel>().addNewSales(
                                cari_kodu: cari_kodu.text,
                                fatura_numarasi: fatura_numarasi.text,
                                fatura_tarihi: _selectedDate,
                                fatura_turu: fatura_turu.text,
                                genel_toplam: genel_toplam.text,
                                ili: ili.text,
                                ticari_unvan: ticari_unvan.text,
                                yetkilisi: yetkilisi.text, /*id: ''*/);
                            Get.back();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
