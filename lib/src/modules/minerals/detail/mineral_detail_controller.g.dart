// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mineral_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MineralDetailController on MineralDetailControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'MineralDetailControllerBase._status', context: context);

  MineralDetailStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  MineralDetailStateStatus get _status => status;

  @override
  set _status(MineralDetailStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'MineralDetailControllerBase._errorMessage', context: context);

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
      Atom(name: 'MineralDetailControllerBase._imagePath', context: context);

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

  late final _$_mineralModelAtom =
      Atom(name: 'MineralDetailControllerBase._mineralModel', context: context);

  MineralModel? get mineralModel {
    _$_mineralModelAtom.reportRead();
    return super._mineralModel;
  }

  @override
  MineralModel? get _mineralModel => mineralModel;

  @override
  set _mineralModel(MineralModel? value) {
    _$_mineralModelAtom.reportWrite(value, super._mineralModel, () {
      super._mineralModel = value;
    });
  }

  late final _$uploadImageMineralAsyncAction = AsyncAction(
      'MineralDetailControllerBase.uploadImageMineral',
      context: context,);

  @override
  Future<void> uploadImageMineral(Uint8List file, String filename) {
    return _$uploadImageMineralAsyncAction
        .run(() => super.uploadImageMineral(file, filename));
  }

  late final _$saveAsyncAction =
      AsyncAction('MineralDetailControllerBase.save', context: context);

  @override
  Future<void> save(String name, double price, String description) {
    return _$saveAsyncAction.run(() => super.save(name, price, description));
  }

  late final _$loadMineralAsyncAction =
      AsyncAction('MineralDetailControllerBase.loadMineral', context: context);

  @override
  Future<void> loadMineral(int? id) {
    return _$loadMineralAsyncAction.run(() => super.loadMineral(id));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
