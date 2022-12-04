import 'package:flutter/material.dart';

import '../utils/uis.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function cb;
  final double width, height, fsize;
  final IconData? icon;

  const CustomButton({
    Key? key,
    required this.title,
    required this.color,
    required this.cb,
    this.width: double.infinity,
    this.height: 60,
    this.fsize: 25,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => cb(),
      child: Container(
        // margin: EdgeInsets.symmetric(
        //   horizontal: 20,
        // ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(1, 1),
              blurRadius: 3,
            )
          ],
        ),
        child: Center(
          child: text(
            text: title,
            family: 'Myanmar',
            size: fsize,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
