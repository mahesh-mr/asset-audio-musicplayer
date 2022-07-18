// ignore_for_file: prefer_const_constructors
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player1/controller/favcontroller/favcontroller.dart';
import 'package:music_player1/model/favmodel.dart';
import 'package:music_player1/view/favourites/fav_add.dart';
import 'package:music_player1/view/players/openplayer.dart';
import 'package:music_player1/view/players/player.dart';
import 'package:music_player1/widgets/glassmorphisom.dart';
import 'package:music_player1/widgets/gradingcontainer.dart';
import 'package:music_player1/widgets/marquee.dart';
import 'package:music_player1/widgets/quryartwork.dart';
import 'package:music_player1/widgets/text.dart';

class Favourited extends StatelessWidget {
  Favourited({Key? key}) : super(key: key);

  FavContoller favContoller = Get.put(FavContoller());

  List<Audio> favSong = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: STexts(text: "Favourites"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * .02),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Grading(widget: FavouriteAdd());
                    });
              },
              icon: const Icon(
                CupertinoIcons.heart_circle,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: GetBuilder<FavContoller>(
            init: FavContoller(),
            builder: (controller) {
              List<favmodel> faveSongs = controller.fbox.values.toList();

              for (var item in faveSongs) {
                favSong.add(Audio.file(item.songurl!,
                    metas: Metas(
                      title: item.songname,
                      artist: item.artist,
                      id: item.id.toString(),
                    )));
              }

              return Stack(children: [
                if (faveSongs.isEmpty) Center(
                        child: Lottie.network(
                            "https://assets3.lottiefiles.com/packages/lf20_bnwxm2d1.json",
                            height: size.height * .1),
                      ) else ListView.builder(
                        itemCount: faveSongs.length,
                        itemBuilder: ((context, index) {
                          return GlassMore(
                            height:size.height*.09,
                            column: ListTile(
                              onTap: () {
                                for (var item in faveSongs) {
                                  favSong.add(Audio.file(item.songurl!,
                                      metas: Metas(
                                          id: item.id.toString(),
                                          artist: item.artist,
                                          title: item.songname)));
                                }
                                OpenPlayer(
                                        fullSongs: favSong,
                                        index: index,
                                        songId:
                                            favSong[index].metas.id.toString())
                                    .openAssetPlayer(index: index, songs: favSong);

                                Get.to(Playings(index: index, fullSongs: favSong));
                              },
                              leading: QuryArtwork(
                                id: faveSongs[index].id!,
                              ),
                              title: Marque(text: faveSongs[index].songname!),
                              subtitle: Marque(
                                text: faveSongs[index].artist!,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  favContoller.favDelete(index);
                                  Get.snackbar("Removed",faveSongs[index].songname! );
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
              ]);
            }),
      ),
    );
  }
}
