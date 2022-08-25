import 'package:json_annotation/json_annotation.dart';

import '../shared.dart';

part 'drop_offs_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class DropOffsModel {
  DropOffsModel({
    this.id,
    required this.dropOffLocation,
    required this.category,
    required this.priority,
    required this.recipientName,
    required this.recipientPhone,
    this.description,
  }) {
    //for now
    id = 'id_${DateTime.now().microsecondsSinceEpoch}';
  }
  @JsonKey(readValue: Serialization.readStringValue)
  String? id;
  @JsonKey(includeIfNull: true)
  final LocationModel dropOffLocation;
  @JsonKey(readValue: Serialization.readStringValue)
  final String category;
  @JsonKey(readValue: Serialization.readStringValue)
  final String priority;
  @JsonKey(readValue: Serialization.readStringValue)
  final String? description;
  @JsonKey(readValue: Serialization.readStringValue)
  final String recipientName;
  @JsonKey(readValue: Serialization.readStringValue)
  final String recipientPhone;

  factory DropOffsModel.fromJson(Map<dynamic, dynamic> json) =>
      _$DropOffsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DropOffsModelToJson(this);

  static DropOffsModel stringToDropOffsModel(Map<dynamic, dynamic>? json) =>
      DropOffsModel.fromJson(json ?? {});

  static Map<dynamic, dynamic>? dropOffsModelToJson(DropOffsModel? dropOff) {
    return dropOff?.toJson();
  }

  Map<String, dynamic> toExpandedJson() {
    Map<String, dynamic> result = toJson();
    result['id'] = id;
    return result;
  }
}
