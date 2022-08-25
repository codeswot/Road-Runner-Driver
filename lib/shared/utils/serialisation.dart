import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Serialization {
  // static GeoPoint? geoPointSerialization(GeoPoint? instance) {
  //   return instance;
  // }

  static Uint8List uint8ListSerialization(Uint8List instance) {
    return instance;
  }

  static RangeValues? rangeValueFromJson(dynamic jso) {
    if (jso == null) return null;
    final Map<String, dynamic> json = Map<String, dynamic>.from(jso);
    return RangeValues((json['start'] as num?)?.toDouble() ?? 0,
        (json['end'] as num?)?.toDouble() ?? 0);
  }

  static Map<String, dynamic>? rangeValueToJson(RangeValues? value) {
    if (value == null) return null;
    return {'start': value.start, 'end': value.end};
  }

  static TimeOfDay? timeValueFromJson(dynamic jso) {
    if (jso == null) return null;
    final Map<String, dynamic> json = Map<String, dynamic>.from(jso);
    return TimeOfDay(
        hour: (json['hour'] as num?)?.toInt() ?? 0,
        minute: (json['minute'] as num?)?.toInt() ?? 0);
  }

  static Map<String, dynamic>? timeValueToJson(TimeOfDay? value) {
    if (value == null) return null;
    return {
      'hour': value.hour,
      'minute': value.minute,
    };
  }

  static String? readStringValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key] as String?;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  static double? readDoubleValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key]?.toDouble();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  static int? readIntValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key] as int?;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  static bool? readBoolValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key] as bool?;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  static Map? readMapValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key] as Map?;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  static List? readListValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key] as List?;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
