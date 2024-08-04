import 'package:bmi/constants/app_constant.dart';
import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  const RightBar({super.key});
  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height*0.04,
          width: width*0.25,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)
            )
          ),
        ),
      ],
    );
  }
}