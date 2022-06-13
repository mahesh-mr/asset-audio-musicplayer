// ignore_for_file: unnecessary_const

import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player1/widgets/players/openplayer.dart';
import 'package:music_player1/model/model.dart';
import 'package:music_player1/widgets/players/player.dart';
import 'package:music_player1/widgets/playlist/customplayings/plylistshowadd.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlyalistScreen extends StatefulWidget {
  String playlistName;
  PlyalistScreen({Key? key, required this.playlistName}) : super(key: key);

  @override
  State<PlyalistScreen> createState() => _PlyalistScreenState();
}

class _PlyalistScreenState extends State<PlyalistScreen> {
  final box = Songbox.getInstance();
  List<Songs>? dbSongs = [];
  List<Songs>? playlistSongs = [];
  List<Audio> playPlaylist = [];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 8, 216, 199),
              Color.fromARGB(255, 151, 216, 230),
              Color.fromARGB(255, 5, 129, 112),
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(widget.playlistName),
              actions: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                    Color.fromARGB(255, 8, 216, 199),
                                    Color.fromARGB(255, 151, 216, 230),
                                    Color.fromARGB(255, 5, 129, 112),
                                  ])),
                              child: Songsheet(
                                playlistName: widget.playlistName,
                              ),
                            );
                          });
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
            body: SafeArea(
                child: Column(children: [
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: box.listenable(),
                    builder: (context, value, child) {
                      var playlistSongs = box.get(widget.playlistName)!;
                      return playlistSongs.isEmpty
                          ? const Center(
                              child: const Text("Empty"),
                            )
                          : ListView.builder(
                              itemCount: playlistSongs.length,
                              itemBuilder: (context, index) => GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 5),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 15, sigmaY: 15),
                                        child: Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.white60,
                                                    Colors.white10
                                                  ]),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                width: 2,
                                                color: Colors.white30,
                                              )),
                                          child: ListTile(
                                            visualDensity: const VisualDensity(
                                                vertical: -3),
                                            leading: QueryArtworkWidget(
                                              artworkFit: BoxFit.cover,
                                              id: playlistSongs[index].id,
                                              // artworkBorder: BorderRadius.circular(5),
                                              type: ArtworkType.AUDIO,

                                              artworkQuality:
                                                  FilterQuality.high,
                                              size: 2000,
                                              quality: 100,
                                              artworkBorder:
                                                  BorderRadius.circular(50),

                                              //============No_Thumbnail=============//
                                              nullArtworkWidget: ClipRRect(
                                                borderRadius: const BorderRadius
                                                        .all(
                                                    const Radius.circular(40)),
                                                child: Image.asset(
                                                  'assets/image/logo.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              playlistSongs[index].songname,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            subtitle: Text(
                                              playlistSongs[index].artist,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            trailing: PopupMenuButton(
                                              itemBuilder:
                                                  (BuildContext context) => [
                                                const PopupMenuItem(
                                                    value: "1",
                                                    child: Text("Remove Song"))
                                              ],
                                              onSelected: (value) {
                                                if (value == "1") {
                                                  setState(() {
                                                    playlistSongs
                                                        .removeAt(index);
                                                    box.put(widget.playlistName,
                                                        playlistSongs);
                                                  });
                                                }
                                              },
                                            ),
                                            onTap: () {
                                              for (var element
                                                  in playlistSongs) {
                                                playPlaylist.add(Audio.file(
                                                    element.songurl!,
                                                    metas: Metas(
                                                      title: element.songname,
                                                      id: element.id.toString(),
                                                      artist: element.artist,
                                                    )));
                                              }
                                              OpenPlayer(
                                                fullSongs: playPlaylist,
                                                index: index,
                                                songId: playPlaylist[index]
                                                    .metas
                                                    .id
                                                    .toString(),
                                              ).openAssetPlayer(
                                                  index: index,
                                                  songs: playPlaylist);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Playings()));
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                    }),
              )
            ]))));
  }
}
