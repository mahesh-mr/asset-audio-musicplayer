import 'package:flutter/material.dart';
import 'package:music_player1/model/model.dart';

class CreratePlaylist extends StatefulWidget {
  const CreratePlaylist({Key? key}) : super(key: key);

  @override
  State<CreratePlaylist> createState() => _CreratePlaylistState();
}

class _CreratePlaylistState extends State<CreratePlaylist> {
  List<Songs> playlists = [];
  final box = Songbox.getInstance();
  String? title;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Playlist Name"),
      content: Form(
          key: formkey,
          child: TextFormField(
            onChanged: (value) {
              title = value.trim();
            },
            validator: (value) {
              List keys = box.keys.toList();
              if (value!.trim() == "") {
                return "Name Required";
              }
              if (keys.where((element) => element == value.trim()).isNotEmpty) {
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
                  style: TextStyle(color: Colors.black),
                )),
            const Spacer(),
            TextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    box.put(title, playlists);
                    Navigator.pop(context);
                    setState(() {});
                  }
                },
                child: const Text(
                  "save",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        )
      ],
    );
  }
}
