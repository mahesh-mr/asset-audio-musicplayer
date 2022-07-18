import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player1/controller/playcontroller/playcontroller.dart';
import 'package:music_player1/controller/songcontroller/songcontroler.dart';
import 'package:music_player1/core/colors/colors.dart';
import 'package:music_player1/model/playmodel.dart';
import 'package:music_player1/model/songmodel.dart';

import 'package:music_player1/widgets/gradingcontainer.dart';
import 'package:music_player1/widgets/marquee.dart';
import 'package:music_player1/widgets/quryartwork.dart';

class PlaylistAdding extends StatelessWidget {
  PlaylistAdding(
      {Key? key,
      required this.playlistName,
      required this.allSongs,
      required this.playlistIndex})
      : super(key: key);
  String playlistName;
  List<Songs> allSongs = [];
  int playlistIndex;

  PlayController playcontroller = Get.find<PlayController>();
  SongsController songsController = Get.put(SongsController());

  List<Audio> playlisted = [];
  List<Songs>? playlistSongs;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Grading(
              widget: Builder(
                builder: (context) {
                  return GetBuilder<PlayController>(
                    init: PlayController(),
                    builder: (controller) {
                      List<Songs> allsongsd =
                          songsController.box.values.toList();

                      playlistSongs = playcontroller.getPlaylistSongs;

                      return ListView.builder(
                        itemCount: allsongsd.length,
                        itemBuilder: (context, index) {
                          bool isSongAdded = playlistSongs!.any((element) =>
                              element.id.toString() ==
                              allsongsd[index].id!.toString());
                          return ListTile(
                            leading: QuryArtwork(id: allsongsd[index].id!),
                            title: Marque(
                              text: allsongsd[index].songname!,
                            ),
                            subtitle: Marque(
                              text: allsongsd[index].songname!,
                            ),
                            trailing: isSongAdded
                                ? IconButton(
                                    onPressed: () {
                                      playcontroller.currentPlaylistSongs
                                          .removeAt(index);
                                      playcontroller.update();
                                    },
                                    icon: const Icon(Icons.check_box,
                                        color: white1),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      playlistSongs!.add(
                                        Songs(
                                          songname: allsongsd[index].songname,
                                          artist: allsongsd[index].artist,
                                          duration: allsongsd[index].duration,
                                          songurl: allsongsd[index].songurl,
                                          id: allsongsd[index].id,
                                        ),
                                      );
                                      controller.playlistAddSong(
                                        playlistIndex,
                                        playSongs(
                                          playlistName: playlistName,
                                          playlistSongs: playlistSongs,
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.add, color: white1),
                                  ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
      icon: const Icon(
        Icons.playlist_add,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
