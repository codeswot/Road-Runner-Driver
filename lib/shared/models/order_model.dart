import 'package:json_annotation/json_annotation.dart';

import '../shared.dart';

part 'order_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class OrderModel {
  OrderModel({
    this.id,
    required this.package,
    required this.driver,
    required this.user,
    this.createdAt,
    this.updatedAt,
    this.status,
  }) {
    //for now
    id = 'id_${DateTime.now().microsecondsSinceEpoch}';
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
  }
  @JsonKey(readValue: Serialization.readStringValue)
  String? id;
  @JsonKey(includeIfNull: true)
  final PackageModel package;
  @JsonKey(includeIfNull: true)
  final DriverModel? driver;
  @JsonKey(includeIfNull: true)
  final UserModel? user;
  @JsonKey(includeIfNull: true)
  OrderStatus? status;
  @JsonKey(includeIfNull: true)
  DateTime? createdAt;
  @JsonKey(includeIfNull: true)
  DateTime? updatedAt;

  factory OrderModel.fromJson(Map<dynamic, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  static OrderModel stringToOrderModel(Map<dynamic, dynamic>? json) =>
      OrderModel.fromJson(json ?? {});

  static Map<dynamic, dynamic>? orderModelToJson(OrderModel? order) {
    return order?.toJson();
  }

  Map<String, dynamic> toExpandedJson() {
    Map<String, dynamic> result = toJson();
    result['id'] = id;
    return result;
  }
}
