import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player1/playar/player.dart';
import 'package:music_player1/songs/songs.dart';

class BottomSheetd extends StatefulWidget {
  const BottomSheetd({Key? key}) : super(key: key);

  @override
  State<BottomSheetd> createState() => _BottomSheetdState();
}

class _BottomSheetdState extends State<BottomSheetd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 248, 230, 236),
          Color.fromARGB(255, 141, 192, 221),
        ],
      )),
      child: player.builderRealtimePlayingInfos(
        builder: (context, realtimePlayingInfos) {
          return ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Playings(),
                  ),
                );
              },
              leading: Container(
                height: 100,
                width: 90,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.asset(player.getCurrentAudioImage!.path,
                    fit: BoxFit.cover),
              ),
              title: Text(player.getCurrentAudioTitle),
              subtitle: Text(player.getCurrentAudioAlbum),
              trailing: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        player.previous();
                      },
                      icon: const Icon(
                        CupertinoIcons.backward_end,
                        color: Color.fromARGB(255, 133, 50, 77),
                      ),
                      ),
                  InkWell(
                      onTap: () {
                        player.playOrPause();
                      },
                      child: Icon(
                          realtimePlayingInfos.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: const Color.fromARGB(255, 133, 50, 77),
                          size: 50)),
                  IconButton(
                    onPressed: () {
                      player.next();
                    },
                    icon: const Icon(
                      CupertinoIcons.forward_end,
                      color: Color.fromARGB(255, 133, 50, 77),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
