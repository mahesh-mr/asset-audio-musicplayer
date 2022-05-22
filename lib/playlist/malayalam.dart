import 'package:flutter/material.dart';
import 'package:music_player1/playlist/malayalamrefact.dart';

class MalaList extends StatelessWidget {
  const MalaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/15.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Malayalam'),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                // ignore: unnecessary_const
                child: const Icon(Icons.add_circle_outline),
              ),
            ],
            centerTitle: true,
          ),
          body: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
              const PlaylistSong(
                  mtitile: "Arikathayi aaroo", msubtitle: "BodyGuard"),
            ],
          ),
        ),
      ],
    );
  }
}
