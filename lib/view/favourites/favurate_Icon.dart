// ignore_for_file: file_names

import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player1/controller/favcontroller/favcontroller.dart';
import 'package:music_player1/core/colors/colors.dart';
import 'package:music_player1/model/favmodel.dart';
import 'package:music_player1/model/songmodel.dart';

// ignore: must_be_immutable
class FavouriteIcon extends StatelessWidget {
  List<Songs> allSongs;
  final int index;

  FavouriteIcon({Key? key, required this.allSongs, required this.index})
      : super(key: key);
  FavContoller favContoller = Get.put(FavContoller());
  List<favmodel> favouriteSong = [];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavContoller>(
      builder: (controller) {
        favouriteSong = controller.fbox.values.toList();
        return favouriteSong
                .where((element) =>
                    element.id.toString() == allSongs[index].id.toString())
                .isEmpty
            ? IconButton(
                onPressed: () {
                  favmodel favSong = favmodel(
                      songname: allSongs[index].songname,
                      artist: allSongs[index].artist,
                      duration: allSongs[index].duration,
                      songurl: allSongs[index].songurl,
                      id: allSongs[index].id);

                  controller.addSongToFav(favSong);
                  Get.snackbar(
                      "Added to favourites", "${allSongs[index].songname!}");
                },
                icon: const Icon(
                  Icons.favorite,
                  color: white1,
                ),
              )
            : IconButton(
                onPressed: () async {
                  int currentIdex = favouriteSong.indexWhere(
                      (element) => element.id == allSongs[index].id);
                  await favContoller.favDelete(currentIdex);

                  Get.snackbar('Removed from Favourites',
                      '${allSongs[index].songname!}');
                },
                icon: const Icon(
                  Icons.favorite,
                  color: red1,
                ),
              );
      },
    );
  }
}
