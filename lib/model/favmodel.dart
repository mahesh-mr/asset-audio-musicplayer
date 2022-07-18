import 'package:hive/hive.dart';
part 'favmodel.g.dart';

@HiveType(typeId: 1)
class favmodel  {
  @HiveField(0)
  String? songname;

  @HiveField(1)
  String? artist;

  @HiveField(2)
  int? duration;

  @HiveField(3)
  String? songurl;

  @HiveField(4)
  int? id;

 favmodel(
      {required this.songname,
      required this.artist,
      required this.duration,
      required this.songurl,
      required this.id});


}

String favboxname = "favsongs";