import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:music_player1/model/songmodel.dart';
import 'package:music_player1/view/others/Home.dart';
import 'package:on_audio_query/on_audio_query.dart';


class  SongsController  extends GetxController {

final box= Hive.box<Songs>(boxname);

songRemove(int index){
  box.deleteAt(index);
  update();
}
songAdd(Songs song){
  box.add(song);
}

  @override
  void onInit() {
 
 requestStoragePermission();
 gotoHome();
    super.onInit();
  }
 gotoHome() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
   Get.offAll( HomeScreen()
      );
    
  }


  final audioQuery = OnAudioQuery();
final boxd = SongBox.getInstance();

List<Audio> fullSongs = [];
List<SongModel>  fetchSongs = [];
List<SongModel> allSongs = [];

  requestStoragePermission() async {
    bool permissionStatus = await audioQuery.permissionsStatus();
    if (!permissionStatus) {
      await audioQuery.permissionsRequest();

      fetchSongs  = await audioQuery.querySongs();

      for (var element in fetchSongs ) {
        if (element.fileExtension == "mp3") {
          allSongs.add(element);
        }
      }
      allSongs.forEach((element) {
        box.add(Songs(
            songname: element.title,
            artist: element.artist,
            duration: element.duration,
            songurl: element.uri,
            id: element.id,
            ),
            );
      });
    } else {}
   

  }
}