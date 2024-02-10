// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorsInfoStruct extends BaseStruct {
  DoctorsInfoStruct({
    String? name,
    String? icon,
    String? url,
  })  : _name = name,
        _icon = icon,
        _url = url;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;
  bool hasIcon() => _icon != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;
  bool hasUrl() => _url != null;

  static DoctorsInfoStruct fromMap(Map<String, dynamic> data) =>
      DoctorsInfoStruct(
        name: data['name'] as String?,
        icon: data['icon'] as String?,
        url: data['url'] as String?,
      );

  static DoctorsInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? DoctorsInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'icon': _icon,
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static DoctorsInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DoctorsInfoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DoctorsInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DoctorsInfoStruct &&
        name == other.name &&
        icon == other.icon &&
        url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([name, icon, url]);
}

DoctorsInfoStruct createDoctorsInfoStruct({
  String? name,
  String? icon,
  String? url,
}) =>
    DoctorsInfoStruct(
      name: name,
      icon: icon,
      url: url,
    );
