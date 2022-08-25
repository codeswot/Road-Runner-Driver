// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map json) => LocationModel(
      address: Serialization.readStringValue(json, 'address') as String,
      latitude: (Serialization.readDoubleValue(json, 'latitude') as num?)
              ?.toDouble() ??
          0.5,
      longitude: (Serialization.readDoubleValue(json, 'longitude') as num?)
              ?.toDouble() ??
          5.0,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };
