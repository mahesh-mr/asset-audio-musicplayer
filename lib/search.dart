import 'package:flutter/material.dart';
import 'package:music_player1/playar/player.dart';
import 'package:music_player1/songs/songs.dart';

class MySearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        color: const Color.fromARGB(255, 14, 13, 13),
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
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 201, 163, 192),
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
            color: const Color.fromARGB(255, 14, 0, 0),
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
        style: const TextStyle(color: const Color.fromARGB(255, 128, 7, 7)),
      ),
    );
  }

// search element
  @override
  Widget buildSuggestions(BuildContext context) {
    final searchSongItems = query.isEmpty
        ? player.playlist!.audios
        : player.playlist!.audios
            .where(
              (element) => element.metas.title!.toLowerCase().contains(
                    query.toLowerCase().toString(),
                  ),
            )
            .toList();

    return Stack(
      children: [
        Image.asset(
          "assets/15.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: const Color.fromARGB(0, 184, 10, 10),
          body: searchSongItems.isEmpty
              ? const Center(
                  child: Text(
                    "No Songs Found!",
                    style: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            onTap: (() async {
                              songsarray(index, searchSongItems);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Playings(),
                              ));
                            }),
                            leading: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "${searchSongItems[index].metas.image!.path}"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            title:
                                Text("${searchSongItems[index].metas.title}"),
                            subtitle:
                                Text("${searchSongItems[index].metas.album}"),
                          ),
                        );

                        // return ListTile(
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: searchSongItems.length),
                ),
        ),
      ],
    );
  }
}
