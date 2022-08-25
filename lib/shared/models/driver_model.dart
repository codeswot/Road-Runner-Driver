import 'package:json_annotation/json_annotation.dart';

import '../shared.dart';

part 'driver_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class DriverModel {
  DriverModel(
      {required this.name,
      required this.image,
      required this.phoneNumber,
      required this.vendor,
      required this.rating,
      required this.rides,
      required this.carName,
      required this.carNumber,
      required this.carColor,
      required this.location,
      this.id}) {
    //for now
    id = 'id_${DateTime.now().microsecondsSinceEpoch}';
  }
  @JsonKey(readValue: Serialization.readStringValue)
  String? id;
  @JsonKey(readValue: Serialization.readStringValue)
  final String name;
  @JsonKey(readValue: Serialization.readStringValue)
  final String image;
  @JsonKey(readValue: Serialization.readStringValue)
  final String phoneNumber;
  @JsonKey(readValue: Serialization.readStringValue)
  final String vendor;
  @JsonKey(readValue: Serialization.readDoubleValue)
  final double rating;
  @JsonKey(includeIfNull: true)
  final LocationModel location;

  @JsonKey(readValue: Serialization.readIntValue)
  final int rides;

  @JsonKey(readValue: Serialization.readStringValue)
  final String carName;
  @JsonKey(readValue: Serialization.readStringValue)
  final String carNumber;
  @JsonKey(readValue: Serialization.readStringValue)
  final String carColor;

  factory DriverModel.fromJson(Map<dynamic, dynamic> json) =>
      _$DriverModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverModelToJson(this);

  static DriverModel stringDriverModel(Map<dynamic, dynamic>? json) =>
      DriverModel.fromJson(json ?? {});

  static Map<dynamic, dynamic>? driverModelToJson(DriverModel? driver) {
    return driver?.toJson();
  }

  Map<String, dynamic> toExpandedJson() {
    Map<String, dynamic> result = toJson();
    result['name'] = name;
    return result;
  }
}
