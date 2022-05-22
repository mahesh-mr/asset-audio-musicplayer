import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player1/playar/player.dart';

class PlaylistSong extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final mtitile;
  // ignore: prefer_typing_uninitialized_variables
  final msubtitle;

  const PlaylistSong({Key? key, required this.mtitile, required this.msubtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Playings()));
      },
      child: SizedBox(
        height: 80,
        child: Card(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage("assets/anar.jpg"), fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mtitile,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 253, 253, 253),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      msubtitle,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                    Color.fromARGB(255, 248, 230, 236),
                                    Color.fromARGB(255, 141, 192, 221),
                                  ])),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const ListTile(
                                    leading: Icon(
                                      CupertinoIcons.tag_solid,
                                      color: Colors.black,
                                    ),
                                    title: Text("Edit name"),
                                  ),
                                  const ListTile(
                                    leading: Icon(
                                      CupertinoIcons.delete_solid,
                                      color: Colors.black,
                                    ),
                                    title: Text("Remove"),
                                  ),
                                ],
                              )));
                    },
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
