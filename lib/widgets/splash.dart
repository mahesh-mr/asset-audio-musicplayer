import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player1/model/model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

// final Box<List<dynamic>> box = StorageBox.getInstance();
// final OnAudioQuery audioQuery = OnAudioQuery();
// final AssetsAudioPlayer player =AssetsAudioPlayer.withId('0');

// List<SongModel> fullSongs = [];
// List<Audio> songDetails = [];
// List<Songs>mappedSongs = [];
// List<Songs>dbsongs = [];

class _SlpashHomeState extends State<SlpashHome> {
  @override
  void initState() {
    requestStoragePermission();
    gotoHome();
    super.initState();
  }

  requestStoragePermission() async {
    bool permissionStatus = await audioQuery.permissionsStatus();
    if (!permissionStatus) {
      await audioQuery.permissionsRequest();
    }
    setState(() {});

    fetchedSongs = await audioQuery.querySongs();

    for (var element in fetchedSongs) {
      if (element.fileExtension == "mp3") {
        allSongs.add(element);
      }
    }

    mappedSongs = allSongs
        .map(
          (audio) => Songs(
              songname: audio.title,
              artist: audio.artist,
              songurl: audio.uri,
              duration: audio.duration,
              id: audio.id),
        )
        .toList();

    await box.put("musics", mappedSongs);
    dbSongs = box.get("musics") as List<Songs>;

    for (var element in dbSongs) {
      fullSongs.add(
        Audio.file(
          element.songurl.toString(),
          metas: Metas(
              title: element.songname,
              id: element.id.toString(),
              artist: element.artist),
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
        body: Center(
          child:  Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_li0pgakp.json',
                height: 70),
              
        
          ),
        ),
      );
    
  }

  Future<void> gotoHome() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => HomeScreen(),
      ),
    );
  }
}

//   void initState() {
//     storagePermission();
//   gotoHome();
//     super.initState();
//   }

// final OnAudioQuery audioQuery = OnAudioQuery();
// final box = Songbox.getInstance();

//   storagePermission() async {
//     bool permissionstatus = await audioQuery.permissionsStatus();
//     if (!permissionstatus){
//       await audioQuery.permissionsRequest();
//     }
//     setState(() {});

//      fetchedSongs = await audioQuery.querySongs();

//      for (var element in fetchedSongs){
//        if(element.fileExtension=="mp3"){
//          allSongs.add(element);
//        }
//      }


//     mappedSongs = allSongs
//         .map(
//           (audio) => Songmodel(
//               songname: audio.title,
//               artist: audio.artist,
//               songurl: audio.uri,
//               duration: audio.duration,
//               id: audio.id),
//         )
//         .toList();
    
//       await box.put("musics", mappedSongs);
//     dbSongs = box.get("musics") as List<Songmodel>;

//    for (var element in dbSongs) {
//       fullSongs.add(
//         Audio.file(
//           element.songurl.toString(),
//           metas: Metas(
//               title: element.songname,
//               id: element.id.toString(),
//               artist: element.artist),
//         ),
//       );
//     }
  //===============================================
    //  fullSongs = await audioQuery.querySongs();
    //  mappedSongs = fullSongs
    //  .map((audio) => Songs(
    //    artist: audio.artist,
    //     duration: audio.duration,
    //     id:audio.id, 
    //     songname: audio.title, 
    //     songurl:audio.uri))
    //     .toList();

       

        // for (var i in dbsongs){
        //   songDetails.add(
        //     Audio.file(
        //       i.songurl.toString(),
        //       metas: Metas(
        //         title: i.songname,
        //         id: i.id.toString(),
        //         artist: i.artist,

        //       )
        //     )
        //   );
        // }
      
  

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     decoration: const BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //         colors: [
  //            Color.fromARGB(255, 8, 216, 199),
  //           Color.fromARGB(255, 151, 216, 230),
  //           Color.fromARGB(255, 5, 129, 112),
  //         ],
  //         tileMode: TileMode.clamp,
  //       ),
  //     ),
  //     child: Scaffold(
  //       backgroundColor: Colors.transparent,
  //       body: Center(
  //         child: Image.asset(
  //           "assets/image/logo.png",
  //         height: 70,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Future<void> gotoHome() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (ctx) => HomeScreen(),
  //     ),
  //   );
  // }

