import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player1/playar/player.dart';

import 'package:music_player1/settings/navigation_Drawer.dart';
import 'package:music_player1/songs/songs_refact.dart';

import '../search.dart';

AssetsAudioPlayer player = AssetsAudioPlayer();

class SongsList extends StatefulWidget {
  const SongsList({Key? key}) : super(key: key);

  @override
  State<SongsList> createState() => _SongsListState();
}

// AssetsAudioPlayer player = AssetsAudioPlayer();

class _SongsListState extends State<SongsList> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    songList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('SONGS'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearch());
              },
              icon: const Icon(Icons.search))
        ],

        // ignore: prefer_const_literals_to_create_immutables
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: ListView.builder(
                itemCount: player.playlist!.audios.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      songsarray(index, player.playlist!.audios);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Playings(),
                      ));
                    },
                    child: SongListed(
                        Simage:
                            player.playlist!.audios[index].metas.image!.path,
                        Stitle: player.playlist!.audios[index].metas.title,
                        Ssubtile: player.playlist!.audios[index].metas.album,
                        artist: player.playlist!.audios[index].metas.artist),
                  );
                }),
          ),
        ],
      ),

      // bottomSheet:    BottomSheetd(),
      // ignore: avoid_unnecessary_containers
    );
  }
}

void songList() async {
  return player.open(
    Playlist(
      audios: [
        Audio(
          "assets/malarhale.mp3",
          metas: Metas(
            title: "Malarhale Malarhale",
            artist: "AR Rahman",
            album: "Love birds",
            image: const MetasImage.asset(
                "assets/anar.jpg"), //can be MetasImage.network
          ),
        ),
        Audio(
          "assets/songs/bombay.mp3",
          metas: Metas(
            title: "Kannalane",
            artist: "AR Rahman",
            album: "Bombay",
            image: const MetasImage.asset(
                "assets/ayalum.jpg"), //can be MetasImage.network
          ),
        ),
        Audio(
          "assets/songs/kannod kanbathellam.mp3",
          metas: Metas(
            title: "Kannod Kanvathellam",
            artist: "AR Rahman",
            album: "Jeens",
            image: const MetasImage.asset(
                "assets/thanka.jpg"), //can be MetasImage.network
          ),
        ),
        Audio(
          "assets/songs/vannathi.mp3",
          metas: Metas(
            title: "Vannathi Puzhayude",
            artist: "kj yesudas",
            album: "Kaliyattam",
            image: const MetasImage.asset(
                "assets/anar.jpg"), //can be MetasImage.network
          ),
        ),
      ],
    ),
    autoStart: false,
    showNotification: true,
  );
}

void songsarray(int index, List<Audio> audios) async {
  await player.open(Playlist(audios: audios, startIndex: index),
      autoStart: true);
}
