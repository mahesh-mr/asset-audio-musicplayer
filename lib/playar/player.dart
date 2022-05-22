import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player1/songs/songs.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

// ignore: must_be_immutable
class Playings extends StatefulWidget {
  Playings({
    Key? key,
  }) : super(key: key);

  @override
  State<Playings> createState() => _PlayingsState();

  AssetsAudioPlayer player = AssetsAudioPlayer();
}

class _PlayingsState extends State<Playings> {
  //  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Color shadowColor = Colors.pink;
    //baground image......
    return Stack(
      children: [
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
              leading: IconButton(
                icon: const Icon(
                  Icons.playlist_play,
                  size: 35,
                ),
                onPressed: () {},
              ),
              elevation: 0.0,
            ),
            body: Container(
              child: player.builderRealtimePlayingInfos(
                  builder: (context, realtimePlayingInfos) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 90,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 400,
                        height: 500,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ClipOval(
                                    child: SizedBox.fromSize(
                                      size:
                                          // ignore: prefer_const_constructors
                                          Size.fromRadius(150), // Image radius
                                      child: Image.asset(
                                          player.getCurrentAudioImage!.path,
                                          fit: BoxFit.cover),
                                    ),
                                  )),
                              // Text(widget.title.toString(),style: TextStyle(color: Colors.white),),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: seekBarWidget(context),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Spacer(),

                                    //privios icon.
                                    InkWell(
                                      child: const Icon(
                                        CupertinoIcons.backward_end_fill,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      onTap: () {
                                        player.previous();
                                      },
                                    ),
                                    const Spacer(),
                                    //speed +10.
                                    InkWell(
                                      child: const Icon(
                                          CupertinoIcons
                                              .arrow_uturn_left_circle,
                                          color: Colors.white,
                                          size: 20),
                                      onTap: () {
                                        player.seekBy(
                                            const Duration(seconds: -20));
                                      },
                                    ),
                                    const Spacer(),

                                    //puse and play.
                                    InkWell(
                                        onTap: () {
                                          player.playOrPause();
                                        },
                                        child: Icon(
                                            realtimePlayingInfos.isPlaying
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            color: Colors.white,
                                            size: 50)),
                                    const Spacer(),
                                    //speed +10.

                                    InkWell(
                                      child: const Icon(
                                          CupertinoIcons
                                              .arrow_uturn_right_circle,
                                          color: Colors.white,
                                          size: 20),
                                      onTap: () {
                                        player.seekBy(
                                            const Duration(seconds: 20));
                                      },
                                    ),
                                    const Spacer(),

                                    //next icon.
                                    InkWell(
                                      child: const Icon(
                                          CupertinoIcons.forward_end_fill,
                                          color: Colors.white,
                                          size: 35),
                                      onTap: () {
                                        player.next();
                                      },
                                    ),
                                    const Spacer(),

                                    // shafile icon.
                                    // InkWell(onTap: (){

                                    // },
                                    //   child: const Icon(
                                    //     CupertinoIcons.shuffle,
                                    //     color: Colors.white,
                                    //     size: 20,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )),
      ],
    );
  }

  //video audio prograss bar.............
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
// music icon button.....................

//animated icons....................

// possible values
// LoopMode.none : not looping
// LoopMode.single : looping a single audio
// LoopMode.playlist : looping the fyll playlist

//toggle the value of looping
}
