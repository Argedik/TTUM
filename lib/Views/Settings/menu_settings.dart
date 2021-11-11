import 'package:flutter/material.dart';
import 'package:ttum/Core/colors.dart';
import 'package:ttum/Core/dimensions.dart';
import 'package:ttum/Models/appbar.dart';
import 'package:ttum/Models/menues.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late List<bool> _isChecked ;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(Menues().options.length, false);
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          appBarTitle: 'Menüler',
        ),
        centerTitle: true,
        backgroundColor: ttum,
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
          child: ListView.builder(
            padding: const EdgeInsets.all(edgeInsetsAll),
            itemCount: Menues().options.length,
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
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: height * 0.12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                Menues().options[index],
                                style: const TextStyle(
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
                    Expanded(
                      flex: 1,
                      child:CheckboxListTile(
                        value: _isChecked[index],
                        onChanged: (val) {
                          setState(
                                () {
                              _isChecked[index] = val!;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }


}
