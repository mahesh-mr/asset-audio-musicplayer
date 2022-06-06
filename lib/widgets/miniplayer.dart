import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:music_player1/model/model.dart';
import 'package:music_player1/widgets/Home.dart';
import 'package:music_player1/widgets/player.dart';
import 'package:music_player1/widgets/splash.dart';

import 'package:on_audio_query/on_audio_query.dart';

class miniplayer extends StatefulWidget {
  // int index;
  // List<Audio> fullSongs = [];

  miniplayer({Key? key,})
      : super(key: key);

  @override
  State<miniplayer> createState() => _miniplayerState();
}

final AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');

// ignore: camel_case_types
class _miniplayerState extends State<miniplayer> {
  // bool isPlaying = false;
  // bool isLooping = false;
  // bool isShuffle = false;
  // Songs? music;
  // final AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');
  // Audio find(List<Audio> source, String fromPath) {
  //   return source.firstWhere((element) => element.path == fromPath);
  // }

  // final box = Songbox.getInstance();
  // List<Songs> dbSongs = [];
  // List<dynamic>? likedSongs = [];

//
  @override
  Widget build(BuildContext context) {
    // dbSongs = box.get("musics") as List<Songs>;
     return player.builderCurrent(
        builder: (BuildContext context, Playing? playing){
        final myAudio = find(fullSongs, playing!.audio.assetAudioPath);
        return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: player.builderCurrent(builder: ((
        context,
        playing,
      ) {
    return Container(





      decoration: const BoxDecoration(
        // ignore: unnecessary_const
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 8, 216, 199),
            Color.fromARGB(255, 196, 227, 233),
            Color.fromARGB(255, 5, 129, 112),
          ],
          tileMode: TileMode.clamp,
        ),
      ),
      child: player.builderCurrent(builder: (context, Playing? playing) {
        final myAudio = find(fullSongs, playing!.audio.assetAudioPath);
        final currentSong = dbSongs.firstWhere(
            (element) => element.id.toString() == myAudio.metas.id.toString());
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Playings(
                    index: 0,
                    fullSongs: fullSongs,
                  ),
                ),
              );
            },

            //Thumbnail

            leading: QueryArtworkWidget(
              artworkFit: BoxFit.cover,
              nullArtworkWidget: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(250),
                ),
                child: Image.asset(
                  'assets/image/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              artworkQuality: FilterQuality.high,
              size: 2000,
              quality: 100,
              artworkHeight: 60,
              artworkWidth: 60,
              id: int.parse(myAudio.metas.id!),
              type: ArtworkType.AUDIO,
              artworkBorder: BorderRadius.circular(50),
            ),
            //Song_Name

            title: SizedBox(
              height: 22,
              child: Marquee(
                blankSpace: 20,
                velocity: 20,
                text: myAudio.metas.title!,
              ),
            ),

            subtitle: SizedBox(
              height: 15,
              child: Marquee(
                blankSpace: 20,
                velocity: 20,
                text: myAudio.metas.artist!.toLowerCase(),
              ),
            ),

            trailing: Wrap(
              alignment: WrapAlignment.center,
              children: [
                //Previous
                 IconButton(
                                      onPressed: playing.index != 0
                                          ? () {
                                              player.previous();
                                            }
                                          : () {},
                                      icon: playing.index == 0
                                          ? const Icon(
                                            Icons.skip_previous_outlined,
                                              size: 30,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.skip_previous,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                    ),
                                    Spacer(),

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
                                isPlaying ? Icons.pause : Icons.play_arrow,size: 30,),
                                          
                                          color: Colors.white,
                                        );
                                      },
                                    ),

                                    //Next
                                    Spacer(),
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
                                              size: 30,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                             Icons.skip_next,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                      iconSize: 30,
                                      color: Colors.white,
                                    ),

              ],
            ),
          ),
        );
      }),
    );
      }
      )
      )
      );
        });
        }}

      

