import 'package:flutter/material.dart';

class Grading extends StatelessWidget {
 
  Grading({ Key? key,required this.widget,this.height }) : super(key: key);
  Widget widget;
  double? height;



  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Color.fromARGB(255, 8, 216, 199),
                                  Color.fromARGB(255, 151, 216, 230),
                                  Color.fromARGB(255, 5, 129, 112),
                                ])),
                            child: widget,
                          );
  }
}