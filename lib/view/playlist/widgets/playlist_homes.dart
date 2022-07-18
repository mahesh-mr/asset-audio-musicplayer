// ignore_for_file: unnecessary_const
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player1/controller/playcontroller/playcontroller.dart';
import 'package:music_player1/controller/songcontroller/songcontroler.dart';
import 'package:music_player1/core/colors/colors.dart';
import 'package:music_player1/model/playmodel.dart';
import 'package:music_player1/model/songmodel.dart';
import 'package:music_player1/view/others/splash.dart';
import 'package:music_player1/view/players/openplayer.dart';
import 'package:music_player1/view/players/player.dart';
import 'package:music_player1/view/playlist/widgets/add_playlist.dart';
import 'package:music_player1/widgets/glassmorphisom.dart';
import 'package:music_player1/widgets/gradingcontainer.dart';
import 'package:music_player1/widgets/marquee.dart';
import 'package:music_player1/widgets/quryartwork.dart';

class PlyalistScreen extends StatelessWidget {
  String playlistName;
  List<Songs> allSongs = [];
  int indexs;
  PlyalistScreen(
      {Key? key,
      required this.playlistName,
      required this.allSongs,
      required this.indexs})
      : super(key: key);
  SongsController songsController = Get.put(SongsController());

  List<Audio> Playlisted = [];
  late Box<playSongs> plBox;
  late Box<Songs> box;
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    PlayController playController = Get.find<PlayController>();
  

    playController.getTheplaylistSongs = indexs;

    return Grading(
      widget: Scaffold(
        backgroundColor:bg,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor:bg,
          title: Text(playlistName),
          actions: [
            PlaylistAdding(
                playlistName: playlistName,
                allSongs: allSongs,
                playlistIndex: indexs),
          
          ],
        ),
        body: GetBuilder<PlayController>(
          init: PlayController(),
            builder: (PlayController playController) {
          for (var song in playController.currentPlaylistSongs) {
            Playlisted.add(
              Audio.file(
                song.songurl!,
                metas: Metas(
                  title: song.songname,
                  artist: song.artist,
                  id: song.id.toString(),
                ),
              ),
            );
          }

          List<Songs> playlistSongs = playController.currentPlaylistSongs;

          // var playlistSongs = box.get(playlistName)!;
          return playlistSongs.isEmpty
              ?  Center(
                  child: Lottie.network(
                  "https://assets8.lottiefiles.com/packages/lf20_y6ilh1zw.json",height: size.height*.1),
                )
              : ListView.builder(
                  itemCount: playlistSongs.length,
                  itemBuilder: (context, index) => GestureDetector(
                    child: GlassMore(
                      height: size.height*.09,
                      column: ListTile(
                        onTap: () {
                          OpenPlayer(
                                  fullSongs: Playlisted,
                                  index: index,
                                  songId: Playlisted[index].metas.id.toString())
                              .openAssetPlayer(index: index, songs: Playlisted);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Playings(
                                      index: index, fullSongs: Playlisted))));
                        },
                        visualDensity: const VisualDensity(vertical: -3),
                        leading: QuryArtwork(
                          id: allSongs[index].id!,
                        ),
                        title: Marque(
                          text: allSongs[index].songname!,
                        ),
                        subtitle: Marque(
                          text: allSongs[index].artist!,
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                         
                                          content: const Text(
                                            'Do you Really want to delete ?',
                                            style: TextStyle(
                                                color: green1),
                                          ),
                                          actions: [
                                              TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'No',
                                                style: TextStyle(
                                                    color:green1),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // controller.songRemove(index);
                                                playController
                                                    .currentPlaylistSongs
                                                    .removeAt(index);
                                                playController.update();
                                               
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Yes',
                                                style: TextStyle(
                                                    color:green1),
                                              ),
                                            ),
                                          
                                          ]));
                            },
                            icon: Icon(Icons.delete,color:white1)),
                       
                      ),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
