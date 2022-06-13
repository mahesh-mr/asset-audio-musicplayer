// import 'dart:ui';

// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:music_player1/model/model.dart';
// import 'package:music_player1/widgets/folder/folderpath.dart';
// import 'package:music_player1/widgets/splash.dart';
// import 'package:on_audio_query/on_audio_query.dart';


// class Folder extends StatefulWidget {
//   const Folder({Key? key}) : super(key: key);

//   @override
//   State<Folder> createState() => _FolderState();
// }

// class _FolderState extends State<Folder> {


//   @override
//   void initState() {
//   getpath();
//     super.initState();
//   }
  


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           centerTitle: true,

//           title: const Text('Folder'),
      
         
//         ),
//         body: SafeArea(
//           child: ListView.builder(
//             itemBuilder: (context, index){
//               return Padding(
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
//                                     child:ListTile(
//                                        visualDensity: const VisualDensity(vertical: -3),
//                                        onTap:(()async{
//                                         Navigator.push(context,
//                                          MaterialPageRoute(
//                                           builder: ((context)=>
//                                           Folderpath(index: index)),
//                                           ));

//                                        }),
//                                        leading:  Icon(Icons.folder,),
//                                        title: Text(gotPath[index]),
//                                        subtitle: Text(''),
//                                     ) ,
                                    
//                               ))),
//                               ),
//                               );
//             },
//             itemCount: gotPath.length,
//             )
//         )
//         );
//   }
//   void getpath(){
//     for(var i = 0; i<allSongs.length;i++){
//       String _path = allSongs[i].data;
//       List<String>getSplitpath;
//       getSplitpath = _path.split('/');
//       gotPathset.add(getSplitpath[getSplitpath.length-2]);
//     }
//     gotPath = gotPathset.toList();
//   }
// }
