// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agronegocio_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AgronegocioDetailController on AgronegocioDetailControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'AgronegocioDetailControllerBase._status', context: context);

  AgronegocioDetailStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  AgronegocioDetailStateStatus get _status => status;

  @override
  set _status(AgronegocioDetailStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'AgronegocioDetailControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_imagePathAtom =
      Atom(name: 'AgronegocioDetailControllerBase._imagePath', context: context);

  String? get imagePath {
    _$_imagePathAtom.reportRead();
    return super._imagePath;
  }

  @override
  String? get _imagePath => imagePath;

  @override
  set _imagePath(String? value) {
    _$_imagePathAtom.reportWrite(value, super._imagePath, () {
      super._imagePath = value;
    });
  }

  late final _$_agronegocioModelAtom =
      Atom(name: 'AgronegocioDetailControllerBase._agronegocioModel', context: context);

  AgronegocioModel? get agronegocioModel {
    _$_agronegocioModelAtom.reportRead();
    return super._agronegocioModel;
  }

  @override
  AgronegocioModel? get _agronegocioModel => agronegocioModel;

  @override
  set _agronegocioModel(AgronegocioModel? value) {
    _$_agronegocioModelAtom.reportWrite(value, super._agronegocioModel, () {
      super._agronegocioModel = value;
    });
  }

  late final _$uploadImageAgronegocioAsyncAction = AsyncAction(
      'AgronegocioDetailControllerBase.uploadImageAgronegocio',
      context: context,);

  @override
  Future<void> uploadImageAgronegocio(Uint8List file, String filename) {
    return _$uploadImageAgronegocioAsyncAction
        .run(() => super.uploadImageAgronegocio(file, filename));
  }

  late final _$saveAsyncAction =
      AsyncAction('AgronegocioDetailControllerBase.save', context: context);

  @override
  Future<void> save(String name, double price, String description) {
    return _$saveAsyncAction.run(() => super.save(name, price, description));
  }

  late final _$loadAgronegocioAsyncAction =
      AsyncAction('AgronegocioDetailControllerBase.loadAgronegocio', context: context);

  @override
  Future<void> loadAgronegocio(int? id) {
    return _$loadAgronegocioAsyncAction.run(() => super.loadAgronegocio(id));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
