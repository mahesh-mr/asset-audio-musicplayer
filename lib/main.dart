// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:music_player1/model/favmodel.dart';
import 'package:music_player1/model/playmodel.dart';
import 'package:music_player1/model/songmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player1/view/others/splash.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(SongsAdapter());
  await Hive.openBox<Songs>(boxname);

  Hive.registerAdapter(favmodelAdapter());
  await Hive.openBox<favmodel>(favboxname);

  Hive.registerAdapter(playSongsAdapter());
  await Hive.openBox<playSongs>(playboxname); 


  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: SlpashHome(),
   
    );
  }
}




