import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player1/controller/songcontroller/songcontroler.dart';
import 'package:music_player1/widgets/others/Home.dart';


class SlpashHome extends StatelessWidget {
  SlpashHome({Key? key}) : super(key: key);

 SongsController songcontroller = Get.put(SongsController());

  



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 8, 216, 199),
            Color.fromARGB(255, 151, 216, 230),
            Color.fromARGB(255, 5, 129, 112),
          ],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DelayedDisplay(
                    delay: const Duration(seconds: 2),
                    child: Image.asset(
                      "assets/image/logo.png",
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const DelayedDisplay(
                    slidingBeginOffset: Offset(0.0, 0.35),
                    slidingCurve: Curves.easeInCirc,
                    fadeIn: true,
                    delay: Duration(seconds: 3),
                    child: Text(
                      "SoulMix..🎼",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // gotoHome() async {
  //   await Future.delayed(
  //     const Duration(seconds: 5),
  //   );
  //   Get.offAll( HomeScreen());
  
    
  // }
}
