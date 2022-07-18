import 'package:assets_audio_player/assets_audio_player.dart';


class OpenPlayer {
  List<Audio> fullSongs;
  int index;
  bool? notify;

  final String songId;

  OpenPlayer({
    required this.fullSongs,
    required this.index,
    required this.songId,
  });

  final AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');

  openAssetPlayer({List<Audio>? songs, required int index}) async {
    player.open(
      Playlist(audios: songs, startIndex: index),
      showNotification: notify == null || notify == true ? true : false,
      notificationSettings: const NotificationSettings(
        stopEnabled: false,
      ),
      autoStart: true,
      loopMode: LoopMode.single,
      headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
      playInBackground: PlayInBackground.enabled,
      volume: 100,
    );
  }
}
