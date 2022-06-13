// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:music_player1/widgets/players/openplayer.dart';
import 'package:music_player1/widgets/players/player.dart';
import 'package:music_player1/widgets/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MySearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 8, 216, 199),
        elevation: 0,
      ),
      // ignore: prefer_const_constructors
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,

        // Use this change the placeholder's text style
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
          // ignore: prefer_const_constructors
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
  @override
  Widget buildSuggestions(BuildContext context) {
    final searchSongItems = query.isEmpty
        ? fullSongs
        : fullSongs
            .where(
              (element) => element.metas.title!.toLowerCase().contains(
                    query.toLowerCase().toString(),
                  ),
            )
            .toList();
    // fullSongs
    //     .where(
    //       (element) => element.metas.artist!.toLowerCase().contains(
    //             query.toLowerCase().toString(),
    //           ),
    //     )
    //     .toList();

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
        body: searchSongItems.isEmpty
            ? const Center(
                child: Text(
                  "No Songs Found!",
                  style: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.white60,
                                            Colors.white10
                                          ]),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.white30,
                                      )),
                                  child: Center(
                                    child: ListTile(
                                      onTap: (() async {
                                        await OpenPlayer(
                                          fullSongs: [],
                                          songId: fullSongs[index]
                                              .metas
                                              .id
                                              .toString(),
                                          index: index,
                                        ).openAssetPlayer(
                                          index: index,
                                          songs: searchSongItems,
                                        );
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: ((context) => Playings()),
                                          ),
                                        );
                                      }),
                                      leading: QueryArtworkWidget(
                                        nullArtworkWidget: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          child: Image.asset(
                                            'assets/image/logo.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        id: int.parse(
                                            searchSongItems[index].metas.id!),
                                        type: ArtworkType.AUDIO,
                                      ),
                                      title: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          searchSongItems[index].metas.title!,
                                        ),
                                      ),
                                      subtitle: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          searchSongItems[index].metas.artist!,
                                        ),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                )))),
                  );
                },
                itemCount: searchSongItems.length,
              ),
      ),
    );
  }
}
