// ignore_for_file: must_be_immutable

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player1/controller/songcontroller/songcontroler.dart';
import 'package:music_player1/core/colors/colors.dart';
import 'package:music_player1/model/songmodel.dart';
import 'package:music_player1/view/favourites/favurate_Icon.dart';
import 'package:music_player1/view/others/Drawer.dart';
import 'package:music_player1/view/others/splash.dart';
import 'package:music_player1/view/players/miniplayer.dart';
import 'package:music_player1/view/players/openplayer.dart';
import 'package:music_player1/view/playlist/widgets/button_playlist.dart';
import 'package:music_player1/widgets/glassmorphisom.dart';
import 'package:music_player1/widgets/marquee.dart';
import 'package:music_player1/widgets/quryartwork.dart';
import 'package:music_player1/widgets/text.dart';
import '../others/search.dart';
import 'package:get/get.dart';

class SongsList extends StatelessWidget {
  SongsList({
    Key? key,
  }) : super(key: key);

  SongsController songsController = Get.put(SongsController());

  List<Audio> converteSongs = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      bottomSheet: Miniplayer(),
      backgroundColor: bg,
      appBar: AppBar(
        elevation: 0,
        title: STexts(text: "Songs"),

        //search==================================================!
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * .02),
            child: IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearch());
              },
              icon: const Icon(
                Icons.search,
                // size: 35,
                color: white1,
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: bg,
      ),
      body: GetBuilder<SongsController>(
        init: SongsController(),
        builder: (controler) {
          List<Songs> dbSongs = controler.box.values.toList();

          for (var item in dbSongs) {
            converteSongs.add(
              Audio.file(
                item.songurl!,
                metas: Metas(
                  title: item.songname,
                  artist: item.artist,
                  id: item.id.toString(),
                ),
              ),
            );
          }

          List<Songs> allDbSongs = dbSongs;

          if (allDbSongs.isEmpty) {
            return Center(
              child: Lottie.network(
                  "https://assets8.lottiefiles.com/packages/lf20_y6ilh1zw.json",height: size.height*.1),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              Songs songs = allDbSongs[index];
              return GlassMore(
                height: size.height * .09,
                column: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: () async {
                        final songid = converteSongs[index].metas.id.toString();
                        await OpenPlayer(
                                fullSongs: converteSongs,
                                index: index,
                                songId: songid)
                            .openAssetPlayer(
                                index: index, songs: converteSongs);
                      },
                      leading: QuryArtwork(
                        id: songs.id!,
                      ),
                      title: Marque(text: songs.songname!),
                      subtitle: Marque(text: songs.artist!),
                      trailing: Wrap(
                        children: [
                          FavouriteIcon(allSongs: allDbSongs, index: index),
                          PlaylistButton(
                            songIndex: index,
                            icons: Icons.more_vert,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: allDbSongs.length,
          );
        },
      ),
    );
  }
}
