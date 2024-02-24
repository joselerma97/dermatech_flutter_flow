// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PredResultStruct extends BaseStruct {
  PredResultStruct({
    String? name,
    double? score,
  })  : _name = name,
        _score = score;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  set score(double? val) => _score = val;
  void incrementScore(double amount) => _score = score + amount;
  bool hasScore() => _score != null;

  static PredResultStruct fromMap(Map<String, dynamic> data) =>
      PredResultStruct(
        name: data['name'] as String?,
        score: castToType<double>(data['score']),
      );

  static PredResultStruct? maybeFromMap(dynamic data) => data is Map
      ? PredResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'score': _score,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'score': serializeParam(
          _score,
          ParamType.double,
        ),
      }.withoutNulls;

  static PredResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      PredResultStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        score: deserializeParam(
          data['score'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PredResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PredResultStruct &&
        name == other.name &&
        score == other.score;
  }

  @override
  int get hashCode => const ListEquality().hash([name, score]);
}

PredResultStruct createPredResultStruct({
  String? name,
  double? score,
}) =>
    PredResultStruct(
      name: name,
      score: score,
    );
