// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 1;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      category: fields[0] as String,
      wallet: fields[1] as String,
      description: fields[3] as String,
      displayMoney: fields[4] as bool,
      money: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.wallet)
      ..writeByte(2)
      ..write(obj.money)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.displayMoney);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
