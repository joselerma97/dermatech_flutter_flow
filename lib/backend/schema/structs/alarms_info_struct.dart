// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlarmsInfoStruct extends BaseStruct {
  AlarmsInfoStruct({
    String? userId,
    String? name,
    String? unit,
    int? amount,
    String? lastSend,
    String? id,
  })  : _userId = userId,
        _name = name,
        _unit = unit,
        _amount = amount,
        _lastSend = lastSend,
        _id = id;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;
  bool hasUnit() => _unit != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;
  void incrementAmount(int amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  // "last_send" field.
  String? _lastSend;
  String get lastSend => _lastSend ?? '';
  set lastSend(String? val) => _lastSend = val;
  bool hasLastSend() => _lastSend != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static AlarmsInfoStruct fromMap(Map<String, dynamic> data) =>
      AlarmsInfoStruct(
        userId: data['user_id'] as String?,
        name: data['name'] as String?,
        unit: data['unit'] as String?,
        amount: castToType<int>(data['amount']),
        lastSend: data['last_send'] as String?,
        id: data['id'] as String?,
      );

  static AlarmsInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? AlarmsInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'name': _name,
        'unit': _unit,
        'amount': _amount,
        'last_send': _lastSend,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'last_send': serializeParam(
          _lastSend,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static AlarmsInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlarmsInfoStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        lastSend: deserializeParam(
          data['last_send'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AlarmsInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AlarmsInfoStruct &&
        userId == other.userId &&
        name == other.name &&
        unit == other.unit &&
        amount == other.amount &&
        lastSend == other.lastSend &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userId, name, unit, amount, lastSend, id]);
}

AlarmsInfoStruct createAlarmsInfoStruct({
  String? userId,
  String? name,
  String? unit,
  int? amount,
  String? lastSend,
  String? id,
}) =>
    AlarmsInfoStruct(
      userId: userId,
      name: name,
      unit: unit,
      amount: amount,
      lastSend: lastSend,
      id: id,
    );
