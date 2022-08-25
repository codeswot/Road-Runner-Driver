// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map json) => OrderModel(
      id: Serialization.readStringValue(json, 'id') as String?,
      package: PackageModel.fromJson(json['package'] as Map),
      driver: json['driver'] == null
          ? null
          : DriverModel.fromJson(json['driver'] as Map),
      user:
          json['user'] == null ? null : UserModel.fromJson(json['user'] as Map),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'package': instance.package.toJson(),
      'driver': instance.driver?.toJson(),
      'user': instance.user?.toJson(),
      'status': _$OrderStatusEnumMap[instance.status],
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.arrived: 'arrived',
  OrderStatus.waitingDriver: 'waitingDriver',
  OrderStatus.packageEnroute: 'packageEnroute',
  OrderStatus.dropOff: 'dropOff',
  OrderStatus.cancelled: 'cancelled',
};
