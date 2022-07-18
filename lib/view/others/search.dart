// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player1/controller/songcontroller/songcontroler.dart';
import 'package:music_player1/model/songmodel.dart';
import 'package:music_player1/view/players/openplayer.dart';
import 'package:music_player1/view/players/player.dart';
import 'package:music_player1/widgets/glassmorphisom.dart';
import 'package:music_player1/widgets/gradingcontainer.dart';
import 'package:music_player1/widgets/marquee.dart';
import 'package:music_player1/widgets/quryartwork.dart';

class MySearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 8, 216, 199),
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: const TextStyle(fontSize: 24.0),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        color: Colors.white,
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

// search element
  SongsController songcontroller = Get.put(SongsController());

  @override
  Widget buildSuggestions(BuildContext context) {
    final size =MediaQuery.of(context).size;
    List<Audio> convertAudios = [];
    List<Songs> dbsongs = songcontroller.box.values.toList();

    for (var item in dbsongs) {
      convertAudios.add(Audio.file(item.songurl!,
          metas: Metas(
              title: item.songname,
              artist: item.artist,
              id: item.id.toString())));
    }

    final searchSongItems = query.isEmpty
        ? convertAudios
        : convertAudios
            .where(
              (element) => element.metas.title!.toLowerCase().contains(
                    query.toLowerCase().toString(),
                  ),
            )
            .toList();

    return Grading(
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        body: searchSongItems.isEmpty
            ? Center(
                child: Lottie.network(
                    "https://assets8.lottiefiles.com/packages/lf20_y6ilh1zw.json",height: size.height*.1),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GlassMore(
                    height: 80,
                    column: Center(
                      child: ListTile(
                        onTap: (() async {
                          for (var item in dbsongs) {
                            convertAudios.add(Audio.file(item.songurl!,
                                metas: Metas(
                                    id: item.id.toString(),
                                    artist: item.artist,
                                    title: item.songname)));
                          }
                          OpenPlayer(
                                  fullSongs: convertAudios,
                                  index: index,
                                  songId:
                                      convertAudios[index].metas.id.toString())
                              .openAssetPlayer(
                                  index: index, songs: searchSongItems);

                          Get.to(Playings(
                              index: index,
                              fullSongs: songcontroller.fullSongs));
                        }),
                        leading: QuryArtwork(
                            id: int.parse(searchSongItems[index].metas.id!)),
                        title:
                            Marque(text: searchSongItems[index].metas.title!),
                        subtitle:
                            Marque(text: searchSongItems[index].metas.artist!),
                      ),
                    ),
                  );
                },
                itemCount: searchSongItems.length,
              ),
      ),
    );
  }
}
