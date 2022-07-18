import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class Marque extends StatelessWidget {
  Marque({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 150,
      child: Marquee(blankSpace: 20, velocity: 20, text: text),
    );
  }
}
