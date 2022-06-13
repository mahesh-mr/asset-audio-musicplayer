import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:music_player1/model/model.dart';

import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:music_player1/widgets/favourites/favurateIcon.dart';
import 'package:music_player1/widgets/playlist/crateplaylist/createplaylist.dart';
import 'package:music_player1/widgets/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

// ignore: must_be_immutable
class Playings extends StatefulWidget {
  Playings({
    Key? key,

    // required this.index,
    // required this.fullSongs,
  }) : super(key: key);

  @override
  State<Playings> createState() => _PlayingsState();
}

AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');

//

class _PlayingsState extends State<Playings> {
  // var favouritesSongs = box.get("favourites");
  //  final assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;
  bool isLooping = false;
  bool isShuffle = false;
  Songs? music;
  final AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  final box = Songbox.getInstance();
  List<Songs> dbSongs = [];
  List<dynamic>? likedSongs = [];

  @override
  Widget build(BuildContext context) {
    dbSongs = box.get("musics") as List<Songs>;
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

//===============Appbar===============//

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Now Playing',
            ),
            centerTitle: true,
          ),
          body: player.builderCurrent(builder: (context, Playing? playing) {
            final myAudio = find(fullSongs, playing!.audio.assetAudioPath);
            // ignore: unused_local_variable

            final currentSong = dbSongs.firstWhere((element) =>
                element.id.toString() == myAudio.metas.id.toString());

            likedSongs = box.get("favourites");
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      height: 600,
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                // ignore: prefer_const_constructors
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.white60, Colors.white10]),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 4,
                                  color: Colors.white30,
                                )),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: ClipOval(
                                      child: SizedBox.fromSize(
                                        size:
                                            // ignore: prefer_const_constructors
                                            Size.fromRadius(
                                                150), // Image radius
                                        child: QueryArtworkWidget(
                                          artworkQuality: FilterQuality.high,
                                          quality: 100,
                                          size: 2000,
                                          artworkFit: BoxFit.cover,
                                          artworkBorder:
                                              BorderRadius.circular(250),
                                          id: int.parse(myAudio.metas.id!),
                                          type: ArtworkType.AUDIO,
                                          nullArtworkWidget: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(250),
                                            ),
                                            child: Image.asset(
                                              'assets/image/logo.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 300,
                                        child: Marquee(
                                          blankSpace: 20,
                                          velocity: 20,
                                          text: player.getCurrentAudioTitle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 150,
                                        child: Marquee(
                                          blankSpace: 20,
                                          velocity: 20,
                                          text: player.getCurrentAudioArtist,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    FavouriteIcon(songId: myAudio.metas.id!),
                                    const Spacer(),
                                    PlaylistButton(song: currentSong)
                                  ],
                                ),

                                //
                                // Text(widget.title.toString(),style: TextStyle(color: Colors.white),),
                                seekBarWidget(context),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      StatefulBuilder(builder:
                                          (BuildContext context,
                                              void Function(void Function())
                                                  setState) {
                                        return !isShuffle
                                            ? IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isShuffle = true;
                                                    player.toggleShuffle();
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.shuffle,
                                                  color: Colors.white,
                                                ))
                                            : IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isShuffle = false;
                                                    player.setLoopMode(
                                                        LoopMode.playlist);
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.cached,
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
                                            ? const Icon(
                                                Icons.skip_previous_outlined,
                                                size: 35,
                                                color: Colors.white54,
                                              )
                                            : const Icon(
                                                Icons.skip_previous,
                                                size: 35,
                                                color: Colors.white,
                                              ),
                                      ),

                                      // IconButton(onPressed: (){
                                      //   player.seekBy(Duration(seconds: 10));
                                      // }, icon: Icon(CupertinoIcons.goforward_15, color: Colors.white, )),

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
                                              isPlaying
                                                  ? Icons.pause
                                                  : Icons.play_arrow,
                                              size: 35,
                                            ),
                                            color: Colors.white,
                                          );
                                        },
                                      ),

                                      //Next

                                      //  IconButton(onPressed: (){
                                      //   player.seekBy(Duration(seconds: -10));
                                      // }, icon: Icon(CupertinoIcons.gobackward_15, color: Colors.white, )),

                                      IconButton(
                                        onPressed: playing.index ==
                                                fullSongs.length - 1
                                            ? () {}
                                            : () {
                                                player.next();
                                              },
                                        icon: playing.index ==
                                                fullSongs.length - 1
                                            ? const Icon(
                                                Icons.skip_next_outlined,
                                                size: 35,
                                                color: Colors.white54,
                                              )
                                            : const Icon(
                                                Icons.skip_next,
                                                size: 35,
                                                color: Colors.white,
                                              ),
                                        iconSize: 35,
                                        color: Colors.white,
                                      ),

                                      StatefulBuilder(builder:
                                          (BuildContext context,
                                              void Function(void Function())
                                                  setState) {
                                        return !isLooping
                                            ? IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isLooping = true;
                                                    player.setLoopMode(
                                                        LoopMode.single);
                                                  });
                                                },
                                                icon: const Icon(
                                                  CupertinoIcons.repeat,
                                                  color: Colors.white,
                                                ))
                                            : IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isLooping = false;
                                                    player.setLoopMode(
                                                        LoopMode.playlist);
                                                  });
                                                },
                                                icon: const Icon(
                                                  CupertinoIcons.repeat_1,
                                                  color: Colors.white,
                                                ));
                                      })
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}

Widget seekBarWidget(BuildContext ctx) {
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

//)toggle the value of looping
