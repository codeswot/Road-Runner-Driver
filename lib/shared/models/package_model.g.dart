// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageModel _$PackageModelFromJson(Map json) => PackageModel(
      id: Serialization.readStringValue(json, 'id') as String?,
      dropOffs: (json['dropOffs'] as List<dynamic>)
          .map((e) => DropOffsModel.fromJson(e as Map))
          .toList(),
      pickUpLocation: LocationModel.fromJson(json['pickUpLocation'] as Map),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PackageModelToJson(PackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pickUpLocation': instance.pickUpLocation.toJson(),
      'dropOffs': instance.dropOffs.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
