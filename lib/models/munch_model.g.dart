// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'munch_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MunchModelAdapter extends TypeAdapter<MunchModel> {
  @override
  final int typeId = 0;

  @override
  MunchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MunchModel(
      owner: fields[0] as String,
      bgPath: fields[1] as String,
      name: fields[2] as String,
      avgRating: fields[3] as double,
      address: fields[4] as String,
      status: fields[5] as Status,
      shopHours: fields[6] as String,
      priceRange: fields[7] as PriceRange,
      gallery1: fields[8] as String,
      gallery2: fields[9] as String,
      gallery3: fields[10] as String,
      tag1: fields[11] as String,
      tag2: fields[12] as String,
      tag3: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MunchModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.owner)
      ..writeByte(1)
      ..write(obj.bgPath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.avgRating)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.shopHours)
      ..writeByte(7)
      ..write(obj.priceRange)
      ..writeByte(8)
      ..write(obj.gallery1)
      ..writeByte(9)
      ..write(obj.gallery2)
      ..writeByte(10)
      ..write(obj.gallery3)
      ..writeByte(11)
      ..write(obj.tag1)
      ..writeByte(12)
      ..write(obj.tag2)
      ..writeByte(13)
      ..write(obj.tag3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MunchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
