import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttum/Core/colors.dart';
import 'package:ttum/Views/2_HomePage/ttum_homepage.dart';

class LoginWithAnonymously extends StatefulWidget {
  const LoginWithAnonymously({Key? key}) : super(key: key);

  @override
  _LoginWithAnonymouslyState createState() => _LoginWithAnonymouslyState();
}

class _LoginWithAnonymouslyState extends State<LoginWithAnonymously> {

  @override
  Widget build(BuildContext context) {
    late bool _isLoading = false;
    Future<void> _signInAnonymously() async {
      setState(() {
        _isLoading = true;
      });
      setState(() {
        _isLoading = false;
        Get.off(const Ttum());
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ttum,
        title: const Text("Patron Uygulaması"),
      ),
      body: Center(
        child: InkWell(
          onTap:_isLoading ? null : _signInAnonymously,
          child: Container(
            width: 150.0,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0.0, 20.0),
                  blurRadius: 15.0,
                  color: Colors.black12,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                Container(
                  height: 50.0,
                  width: 110.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 14.0),
                  child: Text(
                    "Anonim",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .apply(color: Colors.white),
                  ),
                  decoration: const BoxDecoration(
                    color: ttum,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(85.0),
                      topLeft: Radius.circular(85.0),
                      bottomRight: Radius.circular(200.0),
                    ),
                  ),
                ),
                const Icon(
                  Icons.home,
                  size: 30.0,
                  color: ttum,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
