import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:music_player1/controller/playcontroller/playcontroller.dart';
import 'package:music_player1/core/colors/colors.dart';
import 'package:music_player1/model/playmodel.dart';

@immutable
// ignore: must_be_immutable
class CreratePlaylist extends StatelessWidget {
  CreratePlaylist({
    Key? key,
  }) : super(key: key);

  List<playSongs> playlists = [];
  late Box<playSongs> plBox;
  // String? title;
  final formkey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  PlayController playController = Get.find<PlayController>();

  //  plBox = Hive.box<playSongs>(playboxname);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Playlist Name", style: TextStyle(color: green1)),
      content: Form(
          key: formkey,
          child: TextFormField(
            controller: controller,
            onChanged: (value) {
              
            },
            validator: (value) {
              List<playSongs> values = playController.pbox.values.toList();

              // plBox.values.toList();
              bool isAlredyAdded = values
                  .where((element) => element.playlistName == value!.trim())
                  .isNotEmpty;
              if (value!.trim() == "") {
                return "Name Required";
              }
              if (isAlredyAdded) {
                return "This Name Already Exists";
              }
              return null;
            },
          )),
      actions: [
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "cancel",
                  style: TextStyle(color:green1),
                )),
            const Spacer(),
            TextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    playController.playlistAdd(playSongs(
                        playlistName: controller.text, playlistSongs: []));
          
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "save",
                  style: TextStyle(color: green1),
                ))
          ],
        )
      ],
    );
  }
}
