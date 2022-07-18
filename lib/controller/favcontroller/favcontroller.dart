import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:music_player1/model/favmodel.dart';


class FavContoller extends GetxController {

final fbox = Hive.box<favmodel>(favboxname);

addSongToFav(favmodel favSong){

 fbox.add(favSong);
 update();

}


favDelete(int index){
  fbox.deleteAt(index);
   update();
}
  
}