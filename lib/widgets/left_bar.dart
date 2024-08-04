import 'package:bmi/constants/app_constant.dart';
import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({super.key, required this.BarWidth});
  final double BarWidth;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: height*0.04,
          width: BarWidth,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            )
          ),
        ),
      ],
    );
  }
}