// ignore_for_file: unnecessary_const
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player1/controller/playcontroller/playcontroller.dart';
import 'package:music_player1/core/colors/colors.dart';
import 'package:music_player1/model/playmodel.dart';
import 'package:music_player1/view/playlist/widgets/create_play_form.dart';
import 'package:music_player1/view/playlist/widgets/playlist_homes.dart';
import 'package:music_player1/widgets/glassmorphisom.dart';
import 'package:music_player1/widgets/gradingcontainer.dart';
import 'package:music_player1/widgets/text.dart';


class Playlis extends StatelessWidget {
  Playlis({Key? key, this.index}) : super(key: key);
  int? index;

  PlayController playController = Get.put(PlayController());
  List<playSongs> playlistSongs = [];

  final formkey = GlobalKey<FormState>();
  final _playlist = Hive.box<playSongs>(playboxname);


  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: GetBuilder<PlayController>(
     
          builder: (controllers) {
            return FloatingActionButton(
                child: const Icon(Icons.playlist_add),
                backgroundColor: green1,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => CreratePlaylist());
                });
          }),
      backgroundColor: bg,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bg,
        elevation: 0,
        title: STexts(text: "Playlist"),
      ),
      body: GetBuilder<PlayController>(
        builder: (playcontrollers) {
          // playlists = box.keys.toList();
          List<playSongs> playlists = playController.pbox.values.toList();
          return playcontrollers.pbox.isEmpty
              ? Center(
                child: Lottie.network(
                  "https://assets8.lottiefiles.com/packages/lf20_y6ilh1zw.json",height: size.height*.1),
                )
              : ListView.builder(
                  itemCount: playcontrollers.pbox.length,
                  itemBuilder: (context, index) {
                    TextEditingController controller = TextEditingController(
                        text: playlists[index].playlistName);

                    return GlassMore(
                        height: size.height*.09,
                        column: ListTile(
                          leading: Container(
                            height: size.height*.07,
                            width:size.width*.15,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              image: DecorationImage(
                                  image: AssetImage("assets/image/logo.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          title: STexts(text: playlists[index].playlistName!),
                        
                          trailing: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    //  Get.back();
                                    return Grading(
                                      height:size.height*.2,
                                      widget: Column(
                                        children: [
                                          ListTile(
                                            leading: const Icon(
                                              CupertinoIcons.tag_solid,
                                              color: white1,
                                            ),
                                            title: STexts(text: "Edit Name"),
                                            onTap: () {
                                              Get.back();
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                       
                                                        title: const Text(
                                                          'Edit your playlist name',
                                                          style: TextStyle(
                                                              color: green1),
                                                        ),
                                                        content: Form(
                                                            key: formkey,
                                                            child:
                                                                TextFormField(
                                                            
                                                              controller:
                                                                  controller,

                                                              decoration:
                                                                  const InputDecoration(
                                                                      hintText:
                                                                          'Enter a playlistName',
                                                                      filled:
                                                                          true),
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                        .trim() ==
                                                                    '') {
                                                                  return 'Name required';
                                                                }

                                                                return null;
                                                              },
                                                            )),
                                                        actions: [
                                                          Row(
                                                            children: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'cancel',
                                                                  style: TextStyle(
                                                                      color:
                                                                          green1),
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    if (formkey
                                                                        .currentState!
                                                                        .validate()) {

                                                                 playSongs? playlist =         _playlist.getAt(index);
                                                                             
                                                                      playController.playlistAddSong(
                                                                          index,
                                                                          playSongs(
                                                                              playlistName: controller.text,
                                                                              playlistSongs: playlist!.playlistSongs));

                                                                      Navigator.pop(
                                                                          context);
                                                                    }
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'save',
                                                                    style: TextStyle(
                                                                        color:
                                                                            green1),
                                                                  ))
                                                            ],
                                                          )
                                                        ],
                                                      ));
                                            },
                                          ),
                                          ListTile(
                                            leading: const Icon(
                                              CupertinoIcons.delete_solid,
                                              color: red1,
                                            ),
                                            title: STexts(text: "Remove"),
                                            onTap: () {
                                              Get.back();
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: const Text(
                                                      'Do You Want to Delete'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: const Text(
                                                            "cancel")),
                                                    TextButton(
                                                      onPressed: () {
                                                        playController
                                                            .playlistDeleate(
                                                                index);
                                                        Get.back();
                                                        Get.snackbar(
                                                            "Deteled Success Fully",
                                                            "${playlists[index].playlistName}");
                                                      },
                                                      child: const Text('Yes'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.more_vert)),
                          onTap: () {
                            Get.to(
                              PlyalistScreen(
                                  playlistName: playlists[index].playlistName!,
                                  allSongs: playlists[index].playlistSongs!,
                                  indexs: index),
                            );
                          },
                        ));
                  },
                );
        },
      ),
    );
  }
}
