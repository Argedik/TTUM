import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
      String appBarTitle;
      String? appBarSubTitle;
    AppBarTitle({
    required this.appBarTitle,
    this.appBarSubTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(appBarTitle),
        Text(
          appBarSubTitle== null ? "":appBarSubTitle!,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}