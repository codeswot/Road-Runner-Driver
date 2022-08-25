// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_offs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropOffsModel _$DropOffsModelFromJson(Map json) => DropOffsModel(
      id: Serialization.readStringValue(json, 'id') as String?,
      dropOffLocation: LocationModel.fromJson(json['dropOffLocation'] as Map),
      category: Serialization.readStringValue(json, 'category') as String,
      priority: Serialization.readStringValue(json, 'priority') as String,
      recipientName:
          Serialization.readStringValue(json, 'recipientName') as String,
      recipientPhone:
          Serialization.readStringValue(json, 'recipientPhone') as String,
      description:
          Serialization.readStringValue(json, 'description') as String?,
    );

Map<String, dynamic> _$DropOffsModelToJson(DropOffsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dropOffLocation': instance.dropOffLocation.toJson(),
      'category': instance.category,
      'priority': instance.priority,
      'description': instance.description,
      'recipientName': instance.recipientName,
      'recipientPhone': instance.recipientPhone,
    };
