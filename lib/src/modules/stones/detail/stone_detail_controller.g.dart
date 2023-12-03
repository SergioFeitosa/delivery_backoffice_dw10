// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stone_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoneDetailController on StoneDetailControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'StoneDetailControllerBase._status', context: context);

  StoneDetailStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  StoneDetailStateStatus get _status => status;

  @override
  set _status(StoneDetailStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'StoneDetailControllerBase._errorMessage', context: context);

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
      Atom(name: 'StoneDetailControllerBase._imagePath', context: context);

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

  late final _$_stoneModelAtom =
      Atom(name: 'StoneDetailControllerBase._stoneModel', context: context);

  StoneModel? get stoneModel {
    _$_stoneModelAtom.reportRead();
    return super._stoneModel;
  }

  @override
  StoneModel? get _stoneModel => stoneModel;

  @override
  set _stoneModel(StoneModel? value) {
    _$_stoneModelAtom.reportWrite(value, super._stoneModel, () {
      super._stoneModel = value;
    });
  }

  late final _$uploadImageStoneAsyncAction = AsyncAction(
      'StoneDetailControllerBase.uploadImageStone',
      context: context,);

  @override
  Future<void> uploadImageStone(Uint8List file, String filename) {
    return _$uploadImageStoneAsyncAction
        .run(() => super.uploadImageStone(file, filename));
  }

  late final _$saveAsyncAction =
      AsyncAction('StoneDetailControllerBase.save', context: context);

  @override
  Future<void> save(String name, double price, String description) {
    return _$saveAsyncAction.run(() => super.save(name, price, description));
  }

  late final _$loadStoneAsyncAction =
      AsyncAction('StoneDetailControllerBase.loadStone', context: context);

  @override
  Future<void> loadStone(int? id) {
    return _$loadStoneAsyncAction.run(() => super.loadStone(id));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
