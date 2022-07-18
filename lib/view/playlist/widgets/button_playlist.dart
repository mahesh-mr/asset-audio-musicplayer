import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player1/controller/playcontroller/playcontroller.dart';
import 'package:music_player1/model/playmodel.dart';
import 'package:music_player1/model/songmodel.dart';
import 'package:music_player1/view/playlist/widgets/create_play_form.dart';
import 'package:music_player1/widgets/gradingcontainer.dart';
import 'package:music_player1/widgets/text.dart';

// ignore: must_be_immutable
class PlaylistButton extends StatelessWidget {
  PlaylistButton({Key? key, required this.songIndex, required this.icons})
      : super(key: key);
  int songIndex;
  IconData icons;

  PlayController playController = Get.put(PlayController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayController>(
        init: PlayController(),
        builder: (playControllerd) {
          return IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Grading(
                    widget: GetBuilder<PlayController>(
                      init: PlayController(),
                      builder: (controller) {
                        List<playSongs> playlists =
                            playController.pbox.values.toList();
                        return Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.add),
                              title: const Text("Create New Playlist"),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => CreratePlaylist());
                              },
                            ),
                            Expanded(
                              child: controller.pbox.isEmpty
                                  ? Center(
                                      child: STexts(text: "No Playlists"),
                                    )
                                  : ListView.builder(
                                      itemCount: controller.pbox.values.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          onTap: () {
                                            playSongs? plsongs = playController
                                                .plkaylistGet(index);
                                            playController.update();
                                            // playlistBox.getAt(index);
                                            List<Songs>? plnewSongs =
                                                plsongs!.playlistSongs;
                                            Box<Songs> box =
                                                Hive.box<Songs>(boxname);
                                            List<Songs> dbAllSongs =
                                                box.values.toList();

                                            bool isAlreadyAdded =
                                                plnewSongs!.any(
                                              (element) =>
                                                  element.id ==
                                                  dbAllSongs[songIndex].id,
                                            );
                                            if (!isAlreadyAdded) {
                                              plnewSongs.add(
                                                Songs(
                                                  songname:
                                                      dbAllSongs[songIndex]
                                                          .songname,
                                                  artist: dbAllSongs[songIndex]
                                                      .artist,
                                                  duration:
                                                      dbAllSongs[songIndex]
                                                          .duration,
                                                  songurl: dbAllSongs[songIndex]
                                                      .songurl,
                                                  id: dbAllSongs[songIndex].id,
                                                ),
                                              );
                                              playController.playlistAddSong(
                                                  index,
                                                  playSongs(
                                                      playlistName:
                                                          playlists[index]
                                                              .playlistName,
                                                      playlistSongs:
                                                          plnewSongs));

                                              Get.snackbar(
                                                  "Added to ",
                                                  dbAllSongs[songIndex]
                                                          .songname! +
                                                      "" +
                                                      playlists[index]
                                                          .playlistName!);
                                            } else {
                                              Get.snackbar(
                                                  "is already added",
                                                  dbAllSongs[songIndex]
                                                          .songname! +
                                                      "" +
                                                      playlists[index]
                                                          .playlistName!);
                                            }
                                            Navigator.pop(context);
                                          },
                                          leading: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50),
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/image/logo.png"),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          title: Text(
                                              playlists[index].playlistName!),
                                        );
                                      }),
                            )
                          ],
                        );
                      },
                    ),
                  );
                },
              );
            },
            icon: Icon(
              icons,
              color: Colors.white,
            ),
          );
        });
  }
}
