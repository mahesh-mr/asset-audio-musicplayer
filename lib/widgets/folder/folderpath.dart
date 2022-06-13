// import 'dart:ui';

// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:music_player1/model/model.dart';
// import 'package:music_player1/widgets/players/openplayer.dart';
// import 'package:music_player1/widgets/players/player.dart';
// import 'package:music_player1/widgets/splash.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class Folderpath extends StatefulWidget {
//   final int index;
//   const Folderpath({ Key? key, required this.index }) : super(key: key);

//   @override
//   State<Folderpath> createState() => _FolderpathState();
// }

// List<dynamic> foldersongList =[];


// class _FolderpathState extends State<Folderpath> {
//   @override
//   Widget build(BuildContext context) {
//     List <Audio>? foldersong = [];
//     List <String>_getSplitPath = [];
//     for (var i = 1; i <allSongs.length; i++){
//       String _path = allSongs[i].data.toString();
//       _getSplitPath = _path.split('/').toList();

//       if(_getSplitPath[_getSplitPath.length - 2]==
//       gotPath[widget.index] ){
//         foldersongList.add(allSongs[i]);
//       }
//     }
//     return Container(
//        decoration: const BoxDecoration(
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
//         body: SafeArea(
//           child:ListView.builder(
//             itemCount: foldersongList.length,
//             itemBuilder:(context, index){
//               return  Padding(
//                         padding: const EdgeInsets.only(
//                             left: 10, right: 10, bottom: 5),
//                         child: Container(
//                           alignment: Alignment.center,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(0),
//                             child: BackdropFilter(
//                               filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//                               child: Container(
//                                 height: 70,
//                                 decoration: BoxDecoration(
//                                     gradient: const LinearGradient(
//                                         begin: Alignment.topLeft,
//                                         end: Alignment.bottomCenter,
//                                         colors: [
//                                           Colors.white60,
//                                           Colors.white10
//                                         ]),
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                       width: 2,
//                                       color: Colors.white30,
//                                     )),
//                                     child: ListTile(
                                        
//                                       visualDensity: const VisualDensity(vertical: -3),
//                                       title: Text(foldersongList[index].title, 
//                                          maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,),
//                                       onTap:()async{
//                                         for (var element in foldersongList){
//                                           foldersong.add(Audio.file(element.uri!,
//                                          metas: Metas(
//                                           title: element.title,
//                                           id: element.id.toString(),
//                                           artist: element.artist
//                                          ) ));

//                                        final songid =
//                                         foldersong[index].metas.id.toString();
                                   
//                                      OpenPlayer(
//                                             fullSongs:foldersong ,
//                                             index: index,
//                                             songId: songid)
//                                         .openAssetPlayer(
//                                             index: index, songs: foldersong);
//                                             Navigator.of(context).push(
//                                               MaterialPageRoute(builder: (context) => Playings(),)
//                                             );
                                          
//                                         }
//                                         },
                                      
//                                       leading:  QueryArtworkWidget(
//                                         artworkFit: BoxFit.cover,
//                                         id: int.parse(foldersongList[index].id.toString()),
//                                         // artworkBorder: BorderRadius.circular(5),
//                                         type: ArtworkType.AUDIO,

//                                         artworkQuality: FilterQuality.high,
//                                         size: 2000,
//                                         quality: 100,
//                                         artworkBorder:
//                                             BorderRadius.circular(50),

//                                         //============No_Thumbnail=============//
//                                         nullArtworkWidget: ClipRRect(
//                                           borderRadius: const BorderRadius.all(
//                                               const Radius.circular(40)),
//                                           child: Image.asset(
//                                             'assets/image/logo.png',
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       ),
//                                       subtitle: Text(foldersongList[index].artist!,
//                                          maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ),

                                    
//                               )))));
//             }) ),
        
//       ),
      
//     );
//   }
//   Set<Songs> pathSongListset = {};
// }