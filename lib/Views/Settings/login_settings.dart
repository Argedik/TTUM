import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Core/colors.dart';
import 'package:ttum/Core/dimensions.dart';
import 'package:ttum/Models/appbar.dart';
import 'package:ttum/Models/general_setting.dart';
import 'package:ttum/Models/menues.dart';
import 'package:ttum/Views/Settings/login_settings_view_model.dart';

class LoginSettings extends StatefulWidget {
  const LoginSettings({Key? key}) : super(key: key);

  @override
  _LoginSettingsState createState() => _LoginSettingsState();
}

class _LoginSettingsState extends State<LoginSettings> {


  late List<bool> _isChecked;
  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(Menues().securty.length, false);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<LoginSettingsViewModel>(
      create: (BuildContext context) => LoginSettingsViewModel(),
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
            child: StreamBuilder<GeneralSetting>(
              stream:
                  Provider.of<LoginSettingsViewModel>(context, listen: false)
                      .getSettingList(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
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
                    return ListView.builder(
                      padding: const EdgeInsets.all(edgeInsetsAll),
                      itemCount: Menues().securty.length,
                      itemBuilder: (BuildContext context, int index) {

                        // print("absürt");
                        // print(index);
                        // print("${_isChecked[index]} _isChecked");
                        // print("${_isChecked} _isChecked");
                        /*var yg = 0;
                        for (var i in firebaseCheckbox) {
                          _isChecked[yg] = false;
                          yg++;
                        }
                        _isChecked[index] = true;*/

                        var list= snapshot.data!.toMap().values.toList();
                        bool deneme3(){
                          if( list[4]==1 && index == 2 && _isChecked[index]==true){
                            _isChecked[2]=false;
                            _isChecked[4]=true;
                            return true;
                          }else if(list[2]==1 && index==4 && _isChecked[index]==true){
                            _isChecked[2]=true;
                            _isChecked[4]=false;
                            return true;
                          }else if ( _isChecked[index]==true && index!=4 && index!=2){
                            return true;
                          }else{
                            return false;
                          }
                        }
                        bool deneme =deneme3();
                        print("deneme $deneme");
                        // print("deneme $deneme");
/*                        print("$deneme deneme");
                        print(deneme3());
                        print(deneme2);
                        print("son");*/


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
                                    // value: list[index] == 0 ? false : true,
                                    value: deneme,
                                    // value: index==b?true:false,
                                    onChanged: (val) async {
                                      setState(
                                        () {
/*                                          print("deneme2");
                                          print(snapshot.data!.toMap());
                                          print(snapshot.data!
                                              .toMap()
                                              .values
                                              .toList());
                                          print("yeniler");
                                          print(snapshot.data!.toMap().values);*/
                                          var a = 0;
                                          for (var i in _isChecked) {
                                            _isChecked[a] = false;
                                            a++;
                                          }
                                          _isChecked[index] = true;
                                          snapshot.data!.Anonymously;
                                        },
                                      );
/*                                      List firebaseList = snapshot.data!
                                          .toMap()
                                          .values
                                          .toList();
                                      print(firebaseList);*/


                                      List<int> checkBoxList = [];
                                      // checkbox işaretli indexi checkBoxList e atama
                                      var a = 0;
                                      for (var i in _isChecked) {
                                        _isChecked[a] == false
                                            ? checkBoxList.add(0)
                                            : checkBoxList.add(1);
                                        a++;
                                      }
                                      await context
                                          .read<LoginSettingsViewModel>()
                                          .UpdateSettings(
                                            Anonymously: checkBoxList[0],
                                            email: checkBoxList[1],
                                            sms: checkBoxList[2],
                                            kullanici_adi: checkBoxList[3],
                                            google: checkBoxList[4],
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
