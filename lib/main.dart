import 'package:flutter/material.dart';
import 'package:music_player1/splash.dart';



void main(List<String> args) {
  // ignore: prefer_const_constructors
  runApp(MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(primarySwatch: Colors.brown),
      
//  languge---------------------


      // ignore: prefer_const_constructors
      home:SlpashHome(),
    );
    
}
    }
