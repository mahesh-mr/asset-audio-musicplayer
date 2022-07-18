// ignore_for_file: prefer_const_constructors

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player1/controller/songcontroller/songcontroler.dart';
import 'package:music_player1/core/colors/colors.dart';
import 'package:music_player1/model/songmodel.dart';
import 'package:music_player1/view/favourites/favurate_Icon.dart';
import 'package:music_player1/view/playlist/widgets/button_playlist.dart';
import 'package:music_player1/widgets/glassmorphisom.dart';
import 'package:music_player1/widgets/gradingcontainer.dart';
import 'package:music_player1/widgets/marquee.dart';
import 'package:music_player1/widgets/quryartwork.dart';




// ignore: must_be_immutable
class Playings extends StatelessWidget {
  Playings({
    Key? key,
    required this.index,
    required this.fullSongs,
  }) : super(key: key);
  int index;

  List<Audio> fullSongs = [];
  SongsController songsController = Get.put(SongsController());

  AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');

  bool isPlaying = false;
  bool isLooping = false;
  bool isShuffle = false;
  bool isRepeat = false;
  Songs? music;

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  List<Songs> dbSongs = [];
  List<dynamic>? likedSongs = [];
  late Box<Songs> box;
  late List<Songs> allsongs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    allsongs = songsController.box.values.toList();
    return Grading(
      widget: Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: bg,
          elevation: 0,
          title: const Text(
            'Now Playing',
          ),
          centerTitle: true,
        ),
        body: player.builderCurrent(
          builder: (context, Playing? playing) {
            int songId = int.parse(playing!.audio.audio.metas.id!);

            return Center(
              child: GlassMore(
                height: size.height * .7,
                column: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: size.height * .02),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                              size: Size.fromRadius(size.width * .4),
                              child: QuryArtwork(id: songId)),
                        )),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Column(
                      children: [
                        Marque(
                          text: player.getCurrentAudioTitle,
                        ),
                        Marque(
                          text: player.getCurrentAudioArtist,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FavouriteIcon(allSongs: allsongs, index: index),
                        Spacer(),
                        PlaylistButton(
                            songIndex: index, icons: Icons.playlist_add),
                      ],
                    ),
                    seekBarWidget(context),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // StatefulBuilder
                          GetBuilder<SongsController>(
                              init: SongsController(),
                              builder: (controller) {
                                return IconButton(
                                    onPressed: () {
                                      player.toggleShuffle();
                                      songsController.update();
                                    },
                                    icon: player.isShuffling.value
                                        ? const Icon(Icons.shuffle_on_outlined,
                                            color: Colors.white)
                                        : const Icon(
                                            Icons.shuffle,
                                            color: Colors.white,
                                          ));
                              }),

                          //privios icon.
                          IconButton(
                            onPressed: playing.index != 0
                                ? () {
                                    player.previous();
                                  }
                                : () {},
                            icon: playing.index == 0
                                ? Icon(
                                    Icons.skip_previous_outlined,
                                    size: size.width * .09,
                                    color: Colors.white54,
                                  )
                                : Icon(
                                    Icons.skip_previous,
                                    size: size.width * .09,
                                    color: Colors.white,
                                  ),
                          ),

                          //Play
                          PlayerBuilder.isPlaying(
                            player: player,
                            builder: (context, isPlaying) {
                              //PlayOrPause
                              return IconButton(
                                onPressed: () {
                                  player.playOrPause();
                                },
                                icon: Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow,
                                  size: size.width * .09,
                                ),
                                color: Colors.white,
                              );
                            },
                          ),

                          IconButton(
                            onPressed: playing.index == fullSongs.length - 1
                                ? () {}
                                : () {
                                    player.next();
                                  },
                            icon: playing.index == fullSongs.length - 1
                                ? Icon(
                                    Icons.skip_next_outlined,
                                    size: size.width * .09,
                                    color: Colors.white54,
                                  )
                                : Icon(
                                    Icons.skip_next,
                                    size: size.width * .09,
                                    color: Colors.white,
                                  ),
                            iconSize: 35,
                            color: Colors.white,
                          ),

                          GetBuilder<SongsController>(
                              init: SongsController(),
                              builder: (controller) {
                                return IconButton(
                                    onPressed: () {
                                      if (isRepeat) {
                                        player.setLoopMode(LoopMode.none);
                                        songsController.update();
                                        isRepeat = false;
                                      } else {
                                        player.setLoopMode(LoopMode.single);
                                        songsController.update();
                                        isRepeat = true;
                                      }
                                    },
                                    icon: isRepeat
                                        ? const Icon(Icons.repeat_one_sharp,
                                            color: Colors.white)
                                        : const Icon(
                                            Icons.repeat,
                                            color: Colors.white,
                                          ));
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget seekBarWidget(BuildContext ctx) {
  AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');

  return player.builderRealtimePlayingInfos(builder: (ctx, information) {
    Duration nowdPosition = information.currentPosition;
    Duration total = information.duration;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ProgressBar(
        progress: nowdPosition,
        total: total,
        onSeek: (to) {
          player.seek(to);
        },
        timeLabelTextStyle: const TextStyle(color: Colors.white),
        baseBarColor: const Color.fromARGB(255, 190, 190, 190),
        progressBarColor: Colors.white,
        bufferedBarColor: Colors.white,
        thumbColor: Colors.white,
      ),
    );
  });
}
