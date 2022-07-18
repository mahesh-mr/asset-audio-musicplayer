import 'package:flutter/material.dart';
import 'package:music_player1/core/colors/colors.dart';

class STexts extends StatelessWidget {
  STexts({ Key? key,required this.text,this.size}) : super(key: key);
  String text;

  
  double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
           text,
            style: TextStyle(color: white1, fontWeight: FontWeight.bold,fontSize:size),
          );
  }
}