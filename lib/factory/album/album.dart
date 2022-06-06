// import 'package:flutter/material.dart';
// import 'package:music_player1/album/album_list.dart';

// class Album extends StatelessWidget {
//   const Album({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           centerTitle: true,

//           title: const Text('Albums'),
//           // ignore: prefer_const_literals_to_create_immutables
//           actions: [
//             const Padding(
//               padding: EdgeInsets.only(right: 10),
//               child: Icon(Icons.search),
//             )
//           ],
//         ),
//         body: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           childAspectRatio: 25 / 28,
//           children: [
//             ListedAlbum( Atext: 'Bombay'),
//             ListedAlbum( Atext: 'Bombay'),
//             ListedAlbum( Atext: 'Bombay'),
//             ListedAlbum( Atext: 'Bombay'),
//             ListedAlbum( Atext: 'Bombay'),
//             ListedAlbum( Atext: 'Bombay'),
//           ],
//         ));
//   }
// }
