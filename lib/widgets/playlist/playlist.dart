// ignore_for_file: unnecessary_const

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player1/model/model.dart';
import 'package:music_player1/widgets/playlist/customplayings/playlist_custom.dart';
import 'package:music_player1/widgets/playlist/editname.dart';
import 'package:music_player1/widgets/playlist/flottingaction/playlistcreate.dart';
import 'package:music_player1/widgets/playlist/customplayings/playlistscreen.dart';

class Playlis extends StatefulWidget {
  const Playlis({Key? key}) : super(key: key);

  @override
  State<Playlis> createState() => _PlaylisState();
}

List<Audio> recent = [];

class _PlaylisState extends State<Playlis> {
  final box = Songbox.getInstance();
  List playlists = [];
  List<Songs> playlistSongs = [];
  String playlistName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.playlist_add),
            backgroundColor: const Color.fromARGB(255, 5, 129, 112),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CreratePlaylist(),
              );
            }),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            ' Playlist',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, boxes, _) {
              playlists = box.keys.toList();
              return playlistSongs.isEmpty
                  ? const Center(
                      child: const Text("Empty"),
                    )
                  : ListView.builder(
                      itemCount: playlists.length,
                      itemBuilder: (context, index) {
                        var playlistSongs = box.get(playlists[index])!;
                        return playlists[index] != "musics" &&
                                playlists[index] != "favourites" &&
                                playlists[index] != "Recently_Played"
                            ? PlaylistCustom(
                                newTitle: playlists[index].toString(),
                                newSubtitle: playlistSongs.length.toString(),
                                newTrailing: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 200,
                                              decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                    Color.fromARGB(
                                                        255, 8, 216, 199),
                                                    Color.fromARGB(
                                                        255, 151, 216, 230),
                                                    Color.fromARGB(
                                                        255, 5, 129, 112),
                                                  ])),
                                              child: Column(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  ListTile(
                                                    leading: const Icon(
                                                      CupertinoIcons.tag_solid,
                                                      color: Colors.black,
                                                    ),
                                                    title:
                                                        const Text("Edit name"),
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              PlaylistEdit(
                                                                  playlistName:
                                                                      playlists[
                                                                          index]));
                                                    },
                                                  ),
                                                  ListTile(
                                                      leading: const Icon(
                                                        CupertinoIcons
                                                            .delete_solid,
                                                        color: Colors.black,
                                                      ),
                                                      title:
                                                          const Text("Remove"),
                                                      onTap: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                                  title: const Text(
                                                                      'Do You Want to Delete'),
                                                                  actions: [
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: const Text(
                                                                            "cancel")),
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          box.delete(
                                                                              playlists[index]);
                                                                          setState(
                                                                              () {
                                                                            playlists =
                                                                                box.keys.toList();
                                                                          });
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: const Text(
                                                                            'ok')),
                                                                  ],
                                                                ));
                                                      }),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    icon: const Icon(Icons.more_vert)),
                                newOntap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlyalistScreen(
                                              playlistName: playlists[index])));
                                },
                              )
                            : Container();
                      });
            }));
  }
}
