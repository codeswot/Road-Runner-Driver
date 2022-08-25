import 'package:json_annotation/json_annotation.dart';

import '../shared.dart';

part 'user_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserModel {
  UserModel({
    this.id,
    required this.name,
    required this.location,
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
  final LocationModel location;
  @JsonKey(readValue: Serialization.readStringValue)
  String? name;

  @JsonKey(includeIfNull: true)
  DateTime? createdAt;
  @JsonKey(includeIfNull: true)
  DateTime? updatedAt;

  factory UserModel.fromJson(Map<dynamic, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static UserModel stringToUserModel(Map<dynamic, dynamic>? json) =>
      UserModel.fromJson(json ?? {});

  static Map<dynamic, dynamic>? userModelToJson(UserModel? user) {
    return user?.toJson();
  }

  Map<String, dynamic> toExpandedJson() {
    Map<String, dynamic> result = toJson();
    result['id'] = id;
    return result;
  }
}
