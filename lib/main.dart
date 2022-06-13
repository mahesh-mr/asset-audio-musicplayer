// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player1/model/model.dart';
import 'package:music_player1/widgets/splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // initialized hive................................
  Hive.registerAdapter(SongsAdapter()); //adapter registerd....................
  await Hive.openBox<List>(boxname); //db box open.............................
  final box = Songbox.getInstance(); //getinstance.............................

//favourites------------------------------------------------------------------

  List<dynamic> favKeys = box.keys.toList();
  if (!(favKeys.contains("favourites"))) {
    List<dynamic> likedsongs = [];
    await box.put("favourites", likedsongs);
  }
//playlist---------------------------------------------------------------------

  List<dynamic> watchlaterKeys = box.keys.toList();
  if (!(watchlaterKeys.contains("Recently_Played"))) {
    List<dynamic> watchlater = [];
    await box.put("Recently_Played", watchlater);
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),

//  languge---------------------

      home: SlpashHome(),
    );
  }
}
