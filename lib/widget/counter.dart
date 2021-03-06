import 'package:flutter/material.dart';

import '../constant.dart';


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

