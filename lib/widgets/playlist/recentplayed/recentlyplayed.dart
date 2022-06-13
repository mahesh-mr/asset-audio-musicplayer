// import 'dart:ui';
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:music_player1/widgets/players/openplayer.dart';
// import 'package:music_player1/model/model.dart';
// import 'package:music_player1/widgets/players/player.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class RecentlyPlayed extends StatefulWidget {
//   const RecentlyPlayed({Key? key}) : super(key: key);

//   @override
//   State<RecentlyPlayed> createState() => _RecentlyPlayedState();
// }

// List<Audio> recent = [];

// class _RecentlyPlayedState extends State<RecentlyPlayed> {



 

//   @override
//   Widget build(BuildContext context) {
//     final box = Songbox.getInstance();
//     var recentplay = box.get("Recently_Played");
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color.fromARGB(255, 8, 216, 199),
//             Color.fromARGB(255, 151, 216, 230),
//             Color.fromARGB(255, 5, 129, 112),
//           ],
//           tileMode: TileMode.clamp,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           title: const Text("Recently Played"),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) => AlertDialog(
//                             title: const Text("Do You Want Delete"),
//                             actions: [
//                               TextButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: const Text("Cancel")),
//                               TextButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       recentplay!.clear();
//                                     });
//                                     Navigator.pop(context);
//                                   },
//                                   child: const Text("Ok"))
//                             ],
//                           ));
//                 },
//                 icon: const Icon(CupertinoIcons.delete))
//           ],
//         ),
//         body: SafeArea(
//             child: ValueListenableBuilder(
//                 valueListenable: box.listenable(),
//                 builder: (context, value, child) {
//                   return
//                    recentplay!.isEmpty
//                       ? const Center(
//                         child: Text(
//                           'no recent played  songs',
//                           style: TextStyle(color: Colors.green),
//                         ),
//                       )
                      
//                     :  ListView.builder(
//                           reverse: true,
//                       shrinkWrap: true,
//                          itemCount:
//                           recentplay.length > 10 ? 10 : recentplay.length,
//                           itemBuilder: (context, index) {
                                                    

//                             return Container(
//                                 child: recentplay[index] != "musics"&&
//                                 recentplay[index]!= "favourites"
//                              ? ListTile(
//                                 onTap: () {
//                                   for (var element
//                                       in recentplay) {
//                                     recent.add(Audio.file(
//                                         element.songurl,
//                                         metas: Metas(
//                                             title:element
//                                                 .songname,
//                                             id: element
//                                                 .id
//                                                 .toString(),
//                                             artist: element
//                                                 .artist)));
//                                   }
//                                   OpenPlayer(
//                                           fullSongs:
//                                               recent,
//                                           index: index,
//                                           songId:"")
//                                       .openAssetPlayer(
//                                           index: index,
//                                           songs:
//                                               recent);
//                                   Navigator.of(context).push(
//                                       MaterialPageRoute(
//                                           builder: (ctx) =>
//                                               Playings()));
//                                 },
//                                 leading:
//                                     QueryArtworkWidget(
//                                   artworkFit:
//                                       BoxFit.cover,
//                                   id: recentplay[index]
//                                       .id!,
//                                   // artworkBorder: BorderRadius.circular(5),
//                                   type:
//                                       ArtworkType.AUDIO,

//                                   artworkQuality:
//                                       FilterQuality
//                                           .high,
//                                   size: 2000,
//                                   quality: 100,
//                                   artworkBorder:
//                                       BorderRadius
//                                           .circular(50),

//                                   //============No_Thumbnail=============//
//                                   nullArtworkWidget:
//                                       ClipRRect(
//                                     borderRadius:
//                                         const BorderRadius
//                                                 .all(
//                                             Radius
//                                                 .circular(
//                                                     40)),
//                                     child: Image.asset(
//                                       'assets/image/logo.png',
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   recentplay[index]
//                                       .songname,
//                                   maxLines: 1,
//                                   overflow: TextOverflow
//                                       .ellipsis,
//                                 ),
//                                 subtitle: Text(
//                                   recentplay[index]
//                                       .artist,
//                                   maxLines: 1,
//                                   overflow: TextOverflow
//                                       .ellipsis,
//                                 ),
//                               ):Container()
//                             );
//                           });
//                 })),
//       ),
//     );
//   }
// }
