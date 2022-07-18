import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player1/controller/songcontroller/songcontroler.dart';

import 'package:music_player1/view/players/player.dart';
import 'package:music_player1/widgets/gradingcontainer.dart';
import 'package:music_player1/widgets/marquee.dart';
import 'package:music_player1/widgets/quryartwork.dart';

// ignore: camel_case_types
class Miniplayer extends StatelessWidget {
  Miniplayer({
    Key? key,
  }) : super(key: key);

  SongsController songcontroller = Get.put(SongsController());



  final AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');

// ignore: camel_case_types

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Container(
    
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Color.fromARGB(255, 8, 216, 199),
                                  Color.fromARGB(255, 151, 216, 230),
                                  Color.fromARGB(255, 5, 129, 112),
                                ])),
                            child:
                          
       player.builderCurrent(
          builder: (BuildContext context, Playing? playing) {
        int songid = int.parse(playing!.audio.audio.metas.id!);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListTile(
            onTap: () {
              Get.to(
                Playings(index: 0, fullSongs:songcontroller.fullSongs),
              );
            },
            leading: QuryArtwork(id: songid),
            title: Marque(text: playing.audio.audio.metas.title!),
            subtitle: Marque(text: playing.audio.audio.metas.artist!),
            trailing: Wrap(
              alignment: WrapAlignment.center,
              children: [
                //Previous===========================================================================!
                IconButton(
                  onPressed: playing.index != 0
                      ? () {
                          player.previous();
                        }
                      : () {},
                  icon: playing.index == 0
                      ?  Icon(
                          Icons.skip_previous_outlined,
                           size:size.width*.08,
                          color: Colors.white54,
                        )
                      :  Icon(
                          Icons.skip_previous,
                           size:size.width*.08,
                          color: Colors.white,
                        ),
                ),

                //Play===========================================================================!
                PlayerBuilder.isPlaying(
                  player: player,
                  builder: (context, isPlaying) {
                    //PlayOrPause===========================================================================!
                    return IconButton(
                      onPressed: () {
                        player.playOrPause();
                      },
                      icon: Icon(
                        isPlaying
                            ? Icons.pause
                            : CupertinoIcons.play_arrow_solid,
                         size:size.width*.08,
                      ),
                      color: Colors.white,
                    );
                  },
                ),

                //Next===========================================================================!

                IconButton(
                  onPressed: playing.index ==songcontroller. fullSongs.length - 1
                      ? () {}
                      : () {
                          player.next();
                        },
                  icon: playing.index ==songcontroller. fullSongs.length - 1
                      ?  Icon(
                          Icons.skip_next_outlined,
                         size:size.width*.08,
                          color: Colors.white54,
                        )
                      :  Icon(
                          Icons.skip_next,
                            size:size.width*.08,
                          color: Colors.white,
                        ),
                  iconSize: 30,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
