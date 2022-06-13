import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'package:music_player1/model/model.dart';
import 'package:music_player1/widgets/Home.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SlpashHome extends StatefulWidget {
  const SlpashHome({Key? key}) : super(key: key);

  @override
  State<SlpashHome> createState() => _SlpashHomeState();
}

final audioQuery = OnAudioQuery();
final box = Songbox.getInstance();

List<Audio> fullSongs = [];
List<SongModel> fetchedSongs = [];
List<SongModel> allSongs = [];
List<Songs> dbSongs = [];
List<Songs> mappedSongs = [];
Set<String> gotPathset = {};
List<String> gotPath = [];

class _SlpashHomeState extends State<SlpashHome> {
  @override
  void initState() {
    requestStoragePermission();
    gotoHome();
    super.initState();
  }

  //permission-----------------------------------------------

  requestStoragePermission() async {
    bool permissionStatus = await audioQuery.permissionsStatus();
    if (!permissionStatus) {
      await audioQuery.permissionsRequest();
    }
    setState(() {});
//song fetched--------------------------------------------------
    fetchedSongs = await audioQuery.querySongs();
//extention----------------------------------------------------------
    for (var element in fetchedSongs) {
      if (element.fileExtension == "mp3") {
        allSongs.add(element);
      }
    }

//on audioqurt to db-----------------------------------------------
    mappedSongs = allSongs
        .map(
          (audio) => Songs(
              songname: audio.title,
              artist: audio.artist,
              songurl: audio.uri.toString(),
              duration: audio.duration!.toInt(),
              id: audio.id,
              album: audio.album),
        )
        .toList();
//put and get------------------------------------------------------
    await box.put("musics", mappedSongs);

    dbSongs = box.get("musics") as List<Songs>;

//db to asset audio------------------------------------------------
    for (var element in dbSongs) {
      fullSongs.add(
        Audio.file(
          element.songurl.toString(),
          metas: Metas(
              title: element.songname,
              id: element.id.toString(),
              artist: element.artist,
              album: element.album),
        ),
      );
    }
    setState(() {});
  }

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

  Future<void> gotoHome() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => HomeScreen(),
      ),
    );
  }
}
