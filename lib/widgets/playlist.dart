import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player1/factory/playlist/list_play.dart';

import 'package:music_player1/factory/playlist/palylist_refact.dart';

class Playlis extends StatelessWidget {
  const Playlis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          
          child: Icon(Icons.playlist_add),
          backgroundColor: Color.fromARGB(255, 5, 129, 112),
          onPressed: () {}),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,

        centerTitle: true,
        // leading: Icon(Icons.menu_outlined),
        title: const Text('Playlist'),
    
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => PlayListRefact(
                Ptitle: ptitile[index],
              ),
          itemCount: ptitile.length),
    );
  }
}
