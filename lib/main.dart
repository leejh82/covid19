import 'dart:html';
import 'dart:ui';

import 'package:covid19/constant.dart';
import 'package:covid19/info_screen.dart';
import 'package:covid19/widget/counter.dart';
import 'package:covid19/widget/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(bodyText1: TextStyle(color: kBodyTextColor)),
        fontFamily: 'Poppins',
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(image: 'assets/icons/Drcorona.svg',textTop: 'All you need',textBottom: 'is stay at home.',),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xffe5e5e5),
                  )),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/maps-and-flags.svg',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                    value: 'Korea',
                    items: ['Indonesia', 'Japan', 'Korea', 'China']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Case Update\n',
                            style: kTitleTextstyle,
                          ),
                          TextSpan(
                            text: 'Newest update March 28',
                            style: TextStyle(
                              color: kTextLightColor,
                            )
                          )
                        ]
                      )),
                      Spacer(),
                      Text('See details',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 30,
                            color: kShadowColor,
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Counter(title: 'Infected', number: 1062, color: kInfectedColor,),
                        Counter(title: 'Deathed', number: 43, color: kDeathColor,),
                        Counter(title: 'Recovered', number: 15, color: kRecovercolor,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(
                        'Spread of virus',
                        style: kTitleTextstyle,
                      ),
                      Spacer(),
                      Text('See details',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    padding: EdgeInsets.all(20),
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xffe5e5e5),
                        )),
                    child: Image.asset('assets/images/map.png', fit: BoxFit.contain,),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}



