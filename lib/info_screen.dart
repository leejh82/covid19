import 'package:covid19/constant.dart';
import 'package:covid19/widget/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  SizedBox(
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
                        Image.asset('assets/images/wear_mask.png'),
                        Positioned(
                            left: 130,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 136,
                              width: MediaQuery.of(context).size.width-170,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('text'),
                                  Text('text'),
                                  
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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
