import 'package:flutter/material.dart';
import 'package:music_player1/playlist/list_play.dart';
import 'package:music_player1/playlist/malayalam.dart';
import 'package:music_player1/playlist/palylist_refact.dart';

class Playlis extends StatelessWidget {
  const Playlis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          // leading: Icon(Icons.menu_outlined),
          title: const Text('Playlist'),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 10),
          //     child: Icon(Icons.search),
          //   )
          // ],
        ),
        body: Column(
          children: [
            Card(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('assets/Music-Hub-Logo.png'))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Create a New Playlist',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.playlist_add,
                          color: Colors.white,
                          size: 35,
                        ))
                  ],
                )),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MalaList(),
                  ));
                },
                child: ListView.builder(
                    itemBuilder: (context, index) => PlayListRefact(
                          Pimage: pimage[index],
                          Ptitle: ptitile[index],
                        ),
                    itemCount: pimage.length),
              ),
            ),
          ],
        ));
  }
}
