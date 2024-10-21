// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleStruct extends BaseStruct {
  VehicleStruct({
    String? id,
    String? plate,
    String? model,
    int? year,
    String? owner,
    List<String>? maintenances,
  })  : _id = id,
        _plate = plate,
        _model = model,
        _year = year,
        _owner = owner,
        _maintenances = maintenances;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "plate" field.
  String? _plate;
  String get plate => _plate ?? '';
  set plate(String? val) => _plate = val;

  bool hasPlate() => _plate != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;

  bool hasModel() => _model != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  set year(int? val) => _year = val;

  void incrementYear(int amount) => year = year + amount;

  bool hasYear() => _year != null;

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  set owner(String? val) => _owner = val;

  bool hasOwner() => _owner != null;

  // "maintenances" field.
  List<String>? _maintenances;
  List<String> get maintenances => _maintenances ?? const [];
  set maintenances(List<String>? val) => _maintenances = val;

  void updateMaintenances(Function(List<String>) updateFn) {
    updateFn(_maintenances ??= []);
  }

  bool hasMaintenances() => _maintenances != null;

  static VehicleStruct fromMap(Map<String, dynamic> data) => VehicleStruct(
        id: data['id'] as String?,
        plate: data['plate'] as String?,
        model: data['model'] as String?,
        year: castToType<int>(data['year']),
        owner: data['owner'] as String?,
        maintenances: getDataList(data['maintenances']),
      );

  static VehicleStruct? maybeFromMap(dynamic data) =>
      data is Map ? VehicleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'plate': _plate,
        'model': _model,
        'year': _year,
        'owner': _owner,
        'maintenances': _maintenances,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'plate': serializeParam(
          _plate,
          ParamType.String,
        ),
        'model': serializeParam(
          _model,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.int,
        ),
        'owner': serializeParam(
          _owner,
          ParamType.String,
        ),
        'maintenances': serializeParam(
          _maintenances,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static VehicleStruct fromSerializableMap(Map<String, dynamic> data) =>
      VehicleStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        plate: deserializeParam(
          data['plate'],
          ParamType.String,
          false,
        ),
        model: deserializeParam(
          data['model'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.int,
          false,
        ),
        owner: deserializeParam(
          data['owner'],
          ParamType.String,
          false,
        ),
        maintenances: deserializeParam<String>(
          data['maintenances'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'VehicleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VehicleStruct &&
        id == other.id &&
        plate == other.plate &&
        model == other.model &&
        year == other.year &&
        owner == other.owner &&
        listEquality.equals(maintenances, other.maintenances);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, plate, model, year, owner, maintenances]);
}

VehicleStruct createVehicleStruct({
  String? id,
  String? plate,
  String? model,
  int? year,
  String? owner,
}) =>
    VehicleStruct(
      id: id,
      plate: plate,
      model: model,
      year: year,
      owner: owner,
    );
