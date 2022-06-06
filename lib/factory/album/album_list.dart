// // ignore_for_file: unnecessary_const

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ListedAlbum extends StatelessWidget {
//   final Atext;

//   ListedAlbum({Key? key, required this.Atext}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(14.0),
//           child: Container(
//             height: 150,
//             // width: 180,

//             decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 image: DecorationImage(
//                     image: AssetImage("assets/image/log5.png"),
//                     fit: BoxFit.fill)),
//           ),
//         ),
//         Expanded(
//             child: Padding(
//           padding: const EdgeInsets.only(left: 14),
//           child: Row(
//             children: [
//               Text(
//                 Atext,
//                 style: const TextStyle(
//                   color: Color.fromARGB(255, 51, 71, 43),
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const Spacer(),
//               IconButton(
//                 onPressed: () {
//                   showModalBottomSheet(
//                       context: context,
//                       builder: (context) => Container(
//                             height: 200,
//                             decoration: const BoxDecoration(
//                                 gradient: LinearGradient(
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter,
//                                     colors: [
//                                   Color.fromARGB(255, 8, 216, 199),
//                                   Color.fromARGB(255, 151, 216, 230),
//                                   Color.fromARGB(255, 5, 129, 112),
//                                 ])),
//                             child: Column(
//                               // ignore: prefer_const_literals_to_create_immutables
//                               children: [
//                                 const ListTile(
//                                   leading: Icon(
//                                     CupertinoIcons.text_badge_plus,
//                                     color: Colors.black,
//                                   ),
//                                   title: Text("Add to Album"),
//                                 ),
//                                 const ListTile(
//                                   leading: const Icon(
//                                     CupertinoIcons.tag_solid,
//                                     color: Colors.black,
//                                   ),
//                                   title: Text("Edit name"),
//                                 ),
//                                 const ListTile(
//                                   leading: const Icon(
//                                     CupertinoIcons.delete_solid,
//                                     color: Colors.black,
//                                   ),
//                                   title: Text("Remove"),
//                                 ),
//                               ],
//                             ),
//                           ));
//                 },
//                 icon: const Icon(
//                   Icons.more_vert,
//                   color: Colors.white,
//                 ),
//               )
//             ],
//           ),
//         ))
//       ],
//     );
//   }
// }
