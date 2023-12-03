// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minerals_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MineralsController on MineralsControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'MineralsControllerBase._status', context: context);

  MineralStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  MineralStateStatus get _status => status;

  @override
  set _status(MineralStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_mineralsAtom =
      Atom(name: 'MineralsControllerBase._minerals', context: context);

  List<MineralModel> get minerals {
    _$_mineralsAtom.reportRead();
    return super._minerals;
  }

  @override
  List<MineralModel> get _minerals => minerals;

  @override
  set _minerals(List<MineralModel> value) {
    _$_mineralsAtom.reportWrite(value, super._minerals, () {
      super._minerals = value;
    });
  }

  late final _$_filterNameAtom =
      Atom(name: 'MineralsControllerBase._filterName', context: context);

  String? get filterName {
    _$_filterNameAtom.reportRead();
    return super._filterName;
  }

  @override
  String? get _filterName => filterName;

  @override
  set _filterName(String? value) {
    _$_filterNameAtom.reportWrite(value, super._filterName, () {
      super._filterName = value;
    });
  }

  late final _$_mineralSelectedAtom =
      Atom(name: 'MineralsControllerBase._mineralSelected', context: context);

  MineralModel? get mineralSelected {
    _$_mineralSelectedAtom.reportRead();
    return super._mineralSelected;
  }

  @override
  MineralModel? get _mineralSelected => mineralSelected;

  @override
  set _mineralSelected(MineralModel? value) {
    _$_mineralSelectedAtom.reportWrite(value, super._mineralSelected, () {
      super._mineralSelected = value;
    });
  }

  late final _$filterByNameAsyncAction =
      AsyncAction('MineralsControllerBase.filterByName', context: context);

  @override
  Future<void> filterByName(String name) {
    return _$filterByNameAsyncAction.run(() => super.filterByName(name));
  }

  late final _$loadMineralsAsyncAction =
      AsyncAction('MineralsControllerBase.loadMinerals', context: context);

  @override
  Future<void> loadMinerals() {
    return _$loadMineralsAsyncAction.run(() => super.loadMinerals());
  }

  late final _$addMineralAsyncAction =
      AsyncAction('MineralsControllerBase.addMineral', context: context);

  @override
  Future<void> addMineral() {
    return _$addMineralAsyncAction.run(() => super.addMineral());
  }

  late final _$editMineralAsyncAction =
      AsyncAction('MineralsControllerBase.editMineral', context: context);

  @override
  Future<void> editMineral(MineralModel mineralModel) {
    return _$editMineralAsyncAction.run(() => super.editMineral(mineralModel));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
