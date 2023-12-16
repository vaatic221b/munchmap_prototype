import 'package:hive/hive.dart';

part 'bookmark_model.g.dart';

@HiveType(typeId: 2)
class BookmarkModel {
  @HiveField(0)
  String bgPath;

  @HiveField(1)
  String name;

  @HiveField(3)
  String address;

  @HiveField(4)
  String shopHours;

  @HiveField(6)
  String note; // the new property to allow user to leave a note or message on each bookmark


  BookmarkModel({
    required this.bgPath,
    required this.name,
    required this.address,
    required this.shopHours,
    required this.note

  });
}
