
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMore extends StatelessWidget {
 GlassMore({Key? key,required this.column,required this.height}) : super(key: key);
Widget ? column;
double? height;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Container(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height:height,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white60, Colors.white10]),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.white30,
                ),
              ),
              child:column,
            ),
          ),
        ),
      ),
    );
  }
}
