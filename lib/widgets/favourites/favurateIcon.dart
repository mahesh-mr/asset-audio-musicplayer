// ignore_for_file: file_names

import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';
import 'package:music_player1/model/model.dart';

class FavouriteIcon extends StatefulWidget {
  final String songId;

  const FavouriteIcon({Key? key, required this.songId}) : super(key: key);

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  List favouritesSong = [];

  final box = Songbox.getInstance();

  List<Songs> dbSongs = [];

  List<Audio> fullSongs = [];

  List<dynamic>? playlistSongs = [];

  @override
  Widget build(BuildContext context) {
    dbSongs = box.get("musics") as List<Songs>;

    List? favouritesSong = box.get("favourites");

    final fav = databaseSongs(dbSongs, widget.songId);

    return
        // songId==0
        favouritesSong!
                .where((element) => element.id.toString() == fav.id.toString())
                .isEmpty
            ? IconButton(
                onPressed: () async {
                  favouritesSong.add(fav);

                  await box.put("favourites", favouritesSong);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    fav.songname! + " Added to Favourites",
                  )));

                  setState(() {});
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ))
            : IconButton(
                onPressed: () async {
                  favouritesSong.removeWhere(
                      (element) => element.id.toString() == fav.id.toString());
                  await box.put("favourites", favouritesSong);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        fav.songname! + " Removed from Favourites",
                      ),
                    ),
                  );

                  setState(() {});
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ));
  }
}

Songs databaseSongs(List<Songs> songs, String id) {
  return songs.firstWhere(
    (element) => element.songurl.toString().contains(id),
  );
}
