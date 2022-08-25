import 'package:json_annotation/json_annotation.dart';

import '../shared.dart';

part 'location_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class LocationModel {
  LocationModel({
    required this.address,
    this.latitude = 0.5,
    this.longitude = 5.0,
  });

  @JsonKey(readValue: Serialization.readDoubleValue)
  final double latitude;
  @JsonKey(readValue: Serialization.readDoubleValue)
  final double longitude;
  @JsonKey(readValue: Serialization.readStringValue)
  final String address;

  factory LocationModel.fromJson(Map<dynamic, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  static LocationModel stringToLocationModel(Map<dynamic, dynamic>? json) =>
      LocationModel.fromJson(json ?? {});

  static Map<dynamic, dynamic>? locationModelToJson(LocationModel? invite) {
    return invite?.toJson();
  }

  Map<String, dynamic> toExpandedJson() {
    Map<String, dynamic> result = toJson();
    result['address'] = address;
    return result;
  }
}
