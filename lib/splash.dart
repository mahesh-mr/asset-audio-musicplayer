import 'package:flutter/material.dart';
import 'package:music_player1/Home.dart';

class SlpashHome extends StatefulWidget {
  const SlpashHome({Key? key}) : super(key: key);

  @override
  State<SlpashHome> createState() => _SlpashHomeState();
}

class _SlpashHomeState extends State<SlpashHome> {
  @override
  void initState() {
    // TODO: implement initState
    gotoHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "assets/los_splash.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> gotoHome() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => HomeScreen(),
      ),
    );
  }
}
