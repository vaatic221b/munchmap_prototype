import 'package:hive/hive.dart';

part 'munch_model.g.dart'; // Generated file

@HiveType(typeId: 0) // Unique ID for your type
class MunchModel {
  @HiveField(0)
  String owner;

  @HiveField(1)
  String bgPath;

  @HiveField(2)
  String name;

  @HiveField(3)
  double avgRating;

  @HiveField(4)
  String address;

  @HiveField(5)
  Status status;

  @HiveField(6)
  String shopHours;

  @HiveField(7)
  PriceRange priceRange;

  @HiveField(8)
  String gallery1;

  @HiveField(9)
  String gallery2;

  @HiveField(10)
  String gallery3;

  @HiveField(11)
  String tag1;

  @HiveField(12)
  String tag2;

  @HiveField(13)
  String tag3;

  MunchModel({
    required this.owner,
    required this.bgPath,
    required this.name,
    required this.avgRating,
    required this.address,
    required this.status,
    required this.shopHours,
    required this.priceRange,
    required this.gallery1,
    required this.gallery2,
    required this.gallery3,
    required this.tag1,
    required this.tag2,
    required this.tag3,
  });
}

// Enum for Status
enum Status {
  open,
  closed,
}

// Class for PriceRange
class PriceRange {
  final double min;
  final double max;

  PriceRange(this.min, this.max);

  @override
  String toString() {
    return '₱$min - ₱$max';
  }
}