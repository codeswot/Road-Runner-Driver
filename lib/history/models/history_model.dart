import 'package:json_annotation/json_annotation.dart';
import 'package:road_runner_driver/shared/shared.dart';

part 'history_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class HistoryModel {
  HistoryModel({
    required this.order,
    this.id,
    this.updatedAt,
    this.createdAt,
  }) {
    //for now
    id = 'id_${DateTime.now().microsecondsSinceEpoch}';
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
  }
  @JsonKey(readValue: Serialization.readStringValue)
  String? id;
  @JsonKey(includeIfNull: true)
  final OrderModel order;
  @JsonKey(includeIfNull: true)
  DateTime? createdAt;
  @JsonKey(includeIfNull: true)
  DateTime? updatedAt;

  factory HistoryModel.fromJson(Map<dynamic, dynamic> json) =>
      _$HistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);

  static HistoryModel stringHistoryModel(Map<dynamic, dynamic>? json) =>
      HistoryModel.fromJson(json ?? {});

  static Map<dynamic, dynamic>? historyModelToJson(HistoryModel? history) {
    return history?.toJson();
  }

  Map<String, dynamic> toExpandedJson() {
    Map<String, dynamic> result = toJson();
    result['id'] = id;
    return result;
  }
}
