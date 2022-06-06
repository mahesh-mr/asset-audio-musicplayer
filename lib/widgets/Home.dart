

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




import 'package:music_player1/widgets/favourite.dart';


import 'package:music_player1/widgets/playlist.dart';
import 'package:music_player1/widgets/songs.dart';
import 'package:music_player1/widgets/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  // List<Audio>allsongs;
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


 Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }



class _HomeScreenState extends State<HomeScreen> {
  // final OnAudioQuery audioQuery = OnAudioQuery();
  // final AssetsAudioPlayer player =AssetsAudioPlayer.withId('0');

  int _currentSelectedIndex = 0;

  


  // final _pages = [
  //   const SongsList(),
  //   // Playings(index: 0,),
  //   // const Album(),
  //   const Playlis(),
  //   const Favourite(),
  // ];

  @override
  Widget build(BuildContext context) {

final List<Widget> _pages = <Widget>[
   SongsList(
       
      ),
 
    // Playings(index: 0,),
    // const Album(),
    const Playlis(),
    const Favourite(),
  ];


    return Container(


      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //     Color.fromARGB(255, 151, 128, 180),
      //     //  Color.fromARGB(255, 210, 161, 181),
           
      //        Color.fromARGB(255, 244, 228, 228),
      //         // Color.fromARGB(255, 210, 161, 181),
      //          Color.fromARGB(255, 111, 180, 192)
      //     ],
      //     tileMode: TileMode.clamp,
      //   ),
      // ),

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
       
      //   bottomSheet: GestureDetector(onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Playings(
      //                 index: 0,
      //                 fullSongs: widget.allsongs,
      //               )));
      // },
    //     body:
    // player.builderCurrent(
    //     builder:(BuildContext context, Playing? playing){
    //       final myAudio = find(widget.allsongs, playing!.audio.assetAudioPath);
    //       return Container(
    //          decoration: const BoxDecoration(
    //     gradient: LinearGradient(
    //       begin: Alignment.topCenter,
    //       end: Alignment.bottomCenter,
    //       colors: [
    //         Color.fromARGB(255, 8, 216, 199),
    //         Color.fromARGB(255, 151, 216, 230),
    //         Color.fromARGB(255, 5, 129, 112),
    //       ],
    //       tileMode: TileMode.clamp,
    //     ),
    //   ),

    //   child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Wrap(
    //             crossAxisAlignment: WrapCrossAlignment.center,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Container(
    //                   height: 60,
    //                   width: 60,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(5.0),
    //                   ),
    //                   child: QueryArtworkWidget(
    //                       // ignore: prefer_const_constructors
    //                       nullArtworkWidget: ClipRRect(
    //                               borderRadius: BorderRadius.circular(5),
    //                               child: Image.asset('asset/images/new3.png')),
    //                       id: int.parse(myAudio.metas.id!),
    //                       artworkBorder: BorderRadius.circular(5.0),
    //                       type: ArtworkType.AUDIO),
    //                 ),
    //               ),
    //               Column(
    //                 children: [
    //                   SizedBox(
    //                     height: 20,
    //                     width: 180,
    //                     child: Marquee(
    //                       velocity: 20,
    //                       startAfter: Duration.zero,
    //                       blankSpace: 100,
    //                       text: myAudio.metas.title!,
    //                       style: TextStyle(fontSize: 20),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                     width: 180,
    //                     child: Marquee(
    //                       startAfter: Duration.zero,
    //                       blankSpace: 150,
    //                       velocity: 20,
    //                       text: myAudio.metas.artist!,
    //                       style: TextStyle(fontSize: 20),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             width: 45,
    //           ),
    //           Wrap(
    //             spacing: 15.0,
    //             crossAxisAlignment: WrapCrossAlignment.center,
    //             children: [
    //               IconButton(
    //                   onPressed: () {
    //                     player.previous();
    //                   },
    //                   icon: Icon(
    //                     Icons.skip_previous,
    //                     size: 35,
    //                   )),
    //               PlayerBuilder.isPlaying(
    //                   player: player,
    //                   builder: (context, isPlaying) {
    //                     return Container(
    //                       height: 50,
    //                       width: 50,
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(50),
    //                           color: Colors.white),
    //                       child: IconButton(
    //                         onPressed: () async {
    //                           await player.playOrPause();
    //                         },
    //                         icon: Icon(
    //                           isPlaying ? Icons.pause : Icons.play_arrow,
    //                           size: 35,
    //                         ),
    //                       ),
    //                     );
    //                   }),
    //               GestureDetector(
    //                 child: IconButton(
    //                   onPressed: () {
    //                     player.next();
    //                   },
    //                   icon: Icon(
    //                     Icons.skip_next,
    //                     size: 35,
    //                   ),
    //                 ),
    //               ),


    //             ],
    //           ),
    //         ],
    //       ),

    //       );
    //     }
    //     ) ,
      
            body: _pages[_currentSelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            showSelectedLabels: true,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            currentIndex: _currentSelectedIndex,
            // ignore: non_constant_identifier_names
            onTap: (NewIndex) {
              setState(() {
                _currentSelectedIndex = NewIndex;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.music_house),
                  activeIcon: Icon(CupertinoIcons.music_house_fill),
                  label: 'Songs'),
              // BottomNavigationBarItem(
              // // icon: Icon(CupertinoIcons.headphones), label: 'Playing'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.disc_full_outlined),
              //     activeIcon: Icon(Icons.disc_full_rounded),
              //     label: 'Albums'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_music_outlined),
                  activeIcon: Icon(Icons.my_library_music_sharp),
                  label: 'Playlist'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart),
                  activeIcon: Icon(CupertinoIcons.heart_solid),
                  label: 'Favourites'),
            ]),
      

      
    
    ),
    );
  }
}
