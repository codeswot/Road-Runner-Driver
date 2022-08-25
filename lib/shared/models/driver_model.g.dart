// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverModel _$DriverModelFromJson(Map json) => DriverModel(
      name: Serialization.readStringValue(json, 'name') as String,
      image: Serialization.readStringValue(json, 'image') as String,
      phoneNumber: Serialization.readStringValue(json, 'phoneNumber') as String,
      vendor: Serialization.readStringValue(json, 'vendor') as String,
      rating: (Serialization.readDoubleValue(json, 'rating') as num).toDouble(),
      rides: Serialization.readIntValue(json, 'rides') as int,
      carName: Serialization.readStringValue(json, 'carName') as String,
      carNumber: Serialization.readStringValue(json, 'carNumber') as String,
      carColor: Serialization.readStringValue(json, 'carColor') as String,
      location: LocationModel.fromJson(json['location'] as Map),
      id: Serialization.readStringValue(json, 'id') as String?,
    );

Map<String, dynamic> _$DriverModelToJson(DriverModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'phoneNumber': instance.phoneNumber,
      'vendor': instance.vendor,
      'rating': instance.rating,
      'location': instance.location.toJson(),
      'rides': instance.rides,
      'carName': instance.carName,
      'carNumber': instance.carNumber,
      'carColor': instance.carColor,
    };
