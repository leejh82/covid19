import 'package:covid19/constant.dart';
import 'package:covid19/widget/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHeader(
              image: 'assets/icons/coronadr.svg',
              textTop: 'Get to know',
              textBottom: 'About Covid-19.',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Symptems',
                    style: kTitleTextstyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SymptomCard(
                          image: 'assets/images/headache.png',
                          title: 'Headache',
                          isActive: true,
                        ),
                        SymptomCard(
                          image: 'assets/images/fever.png',
                          title: 'Fever',
                          isActive: false,
                        ),
                        SymptomCard(
                          image: 'assets/images/caugh.png',
                          title: 'Caugh',
                          isActive: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prevention',
                    style: kTitleTextstyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PreventCard(
                    image: 'assets/images/wear_mask.png',
                    text1: 'Wear face mask',
                    text2:
                        'Sinc the start of the coronavirus outbreak some place hace full embraced wearing',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PreventCard(
                    image: 'assets/images/wash_hands.png',
                    text1: 'Wash your hands',
                    text2:
                    'Sinc the start of the coronavirus outbreak some place hace full embraced wearing',
                  ),
                  SizedBox(
                    height: 30,
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

class PreventCard extends StatelessWidget {
  final String text1;
  final String text2;
  final String image;

  const PreventCard({
    Key? key,
    required this.text1,
    required this.text2,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 156,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 136,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kActiveShadowColor,
                  )
                ]),
          ),
          Image.asset(image),
          Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: kTitleTextstyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      text2,
                      style: TextStyle(fontSize: 12),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset('assets/icons/forward.svg'))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String title;
  final String image;
  final bool isActive;

  const SymptomCard({
    Key? key,
    required this.title,
    required this.image,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              isActive
                  ? BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 20,
                      color: kActiveShadowColor,
                    )
                  : BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      color: kActiveShadowColor,
                    )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
