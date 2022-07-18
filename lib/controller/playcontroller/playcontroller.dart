import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:music_player1/model/playmodel.dart';
import 'package:music_player1/model/songmodel.dart';
import 'package:music_player1/view/others/splash.dart';

class PlayController extends GetxController {
  final pbox = Hive.box<playSongs>(playboxname);

  RxList<Songs> currentPlaylistSongs = <Songs>[].obs;

  List<Songs> get getPlaylistSongs => currentPlaylistSongs.value;

  playDelete(playSongs playsongs, int playlistIndex) {
    pbox.putAt(playlistIndex, playsongs);
    currentPlaylistSongs.value = playsongs.playlistSongs!;
    update();
  }

  playlistDeleate(int index) {
    pbox.deleteAt(index);
    update();
  }
  playlistAdd(playSongs playsongs){
    pbox.add(playsongs);
    update();
  }


  playlistAddSong(int index, playSongs playsongs) {
    pbox.putAt(index, playsongs);

    currentPlaylistSongs.value = playsongs.playlistSongs!;
    update();
  }

  set getTheplaylistSongs(int playlistIndex) {
    playSongs? currentPlaylist = pbox.getAt(playlistIndex);

    currentPlaylistSongs.value = currentPlaylist!.playlistSongs!;
  }

  plkaylistGet(int index) {
    playSongs? playsongs = pbox.getAt(index);

    return playsongs;
  }

  // @override
  // void onInit() {

  //   // TODO: implement onInit
  //   super.onInit();
  // }
}
