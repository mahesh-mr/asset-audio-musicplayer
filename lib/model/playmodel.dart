import 'package:hive/hive.dart';

import 'package:music_player1/model/songmodel.dart';

part 'playmodel.g.dart';

@HiveType(typeId: 2)
class playSongs extends HiveObject  {
   @HiveField(0)
  String? playlistName;

  @HiveField(1)
  List<Songs>? playlistSongs;

  playSongs(
      {required this.playlistName,
      required this.playlistSongs,
      });


}

String playboxname = "playsongs";