

import 'package:covid19/widget/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(image: 'assets/icons/coronadr.svg',textTop: 'Get to know',textBottom: 'About Covid-19.',),


          ],
        ),
      ),

    );
  }
}
