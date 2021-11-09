import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Core/colors.dart';
import 'package:ttum/Core/dimensions.dart';
import 'package:ttum/Models/appbar.dart';
import 'package:ttum/Models/general_setting.dart';
import 'package:ttum/Models/menues.dart';
import 'package:ttum/Views/Settings/securty_view_model.dart';

class securty extends StatefulWidget {
  const securty({Key? key}) : super(key: key);

  @override
  _securtyState createState() => _securtyState();
}

class _securtyState extends State<securty> {
  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(Menues().securty.length, false);
    print(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<SecurityViewModel>(
      create: (BuildContext context) => SecurityViewModel(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: ttum,
          title: AppBarTitle(
            appBarTitle: 'Genel Ayarlar',
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

            /*StreamBuilder<List<Sales>>(
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
            ),*/
            child: StreamBuilder<List<GeneralSetting>>(
              stream: Provider.of<SecurityViewModel>(context, listen: false)
                  .getSettingList(),
              builder:
                  (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasError){
                      return const Center(
                        child: Text("Bir hata oluştu. Daha sonra tekrar deneyiniz"),
                      );
                    }else{
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<GeneralSetting?> salesList = snapshot.data!;
                        print(salesList);
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
                                      data:
                                      ThemeData(unselectedWidgetColor: Colors.white),
                                      child: CheckboxListTile(
                                        value: _isChecked[index],
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
                                            _isChecked[a] == false ? b.add(0) : b.add(1);
                                            print(b);
                                            a++;
                                          }
                                          await context
                                              .read<SecurityViewModel>()
                                              .UpdateSecurtySettings(
                                            Anonymously: b[0],
                                            email: b[1],
                                            sms: b[2],
                                            kullanici_adi: b[3],
                                            google: b[4],
                                          );
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
                                          title: detay.substring(0, detay.indexOf(",")),
                                          backgroundColor: ttum,
                                          titleStyle: TextStyle(color: Colors.white),
                                          middleTextStyle: TextStyle(color: Colors.white),
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
                                          IconData(983233, fontFamily: 'MaterialIcons'),
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
