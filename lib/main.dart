import 'dart:html';
import 'dart:ui';

import 'package:covid19/constant.dart';
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
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 40, top: 50, right: 20),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff3383cd),
                      Color(0xff11249f),
                    ],
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/virus.png'),
                  )),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Drcorona.svg',
                          width: 230,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                        Positioned(
                          top: 20,
                          left: 150,
                          child: Text(
                            'All you need \nis stay at home.',
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    ))
                  ]),
            ),
          ),
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
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  height: 160,
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
    );
  }
}

class Counter extends StatelessWidget {
  final int number;
  final String title;
  final Color color;
  const Counter({
    Key? key, required this.number, required this.title, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              )
            ),
        ),
        ),
        SizedBox(height: 10,),
        Text('$number',
        style: TextStyle(
          fontSize: 40,
          color: color,
        ),
        ),
        Text(title,
          style: kSubTextStyle,
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
