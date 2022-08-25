import 'package:json_annotation/json_annotation.dart';

import '../shared.dart';

part 'package_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class PackageModel {
  PackageModel({
    this.id,
    required this.dropOffs,
    required this.pickUpLocation,
    this.createdAt,
    this.updatedAt,
  }) {
    //for now
    id = 'id_${DateTime.now().microsecondsSinceEpoch}';
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
  }
  @JsonKey(readValue: Serialization.readStringValue)
  String? id;
  @JsonKey(includeIfNull: true)
  final LocationModel pickUpLocation;
  @JsonKey(includeIfNull: true)
  final List<DropOffsModel> dropOffs;
  @JsonKey(includeIfNull: true)
  DateTime? createdAt;
  @JsonKey(includeIfNull: true)
  DateTime? updatedAt;

  factory PackageModel.fromJson(Map<dynamic, dynamic> json) =>
      _$PackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageModelToJson(this);

  static PackageModel stringToPackageModel(Map<dynamic, dynamic>? json) =>
      PackageModel.fromJson(json ?? {});

  static Map<dynamic, dynamic>? packageModelToJson(PackageModel? package) {
    return package?.toJson();
  }

  Map<String, dynamic> toExpandedJson() {
    Map<String, dynamic> result = toJson();
    result['id'] = id;
    return result;
  }
}
