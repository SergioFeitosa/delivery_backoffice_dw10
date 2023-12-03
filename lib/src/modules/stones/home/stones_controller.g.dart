// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stones_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StonesController on StonesControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'StonesControllerBase._status', context: context);

  StoneStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  StoneStateStatus get _status => status;

  @override
  set _status(StoneStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_stonesAtom =
      Atom(name: 'StonesControllerBase._stones', context: context);

  List<StoneModel> get stones {
    _$_stonesAtom.reportRead();
    return super._stones;
  }

  @override
  List<StoneModel> get _stones => stones;

  @override
  set _stones(List<StoneModel> value) {
    _$_stonesAtom.reportWrite(value, super._stones, () {
      super._stones = value;
    });
  }

  late final _$_filterNameAtom =
      Atom(name: 'StonesControllerBase._filterName', context: context);

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

  late final _$_stoneSelectedAtom =
      Atom(name: 'StonesControllerBase._stoneSelected', context: context);

  StoneModel? get stoneSelected {
    _$_stoneSelectedAtom.reportRead();
    return super._stoneSelected;
  }

  @override
  StoneModel? get _stoneSelected => stoneSelected;

  @override
  set _stoneSelected(StoneModel? value) {
    _$_stoneSelectedAtom.reportWrite(value, super._stoneSelected, () {
      super._stoneSelected = value;
    });
  }

  late final _$filterByNameAsyncAction =
      AsyncAction('StonesControllerBase.filterByName', context: context);

  @override
  Future<void> filterByName(String name) {
    return _$filterByNameAsyncAction.run(() => super.filterByName(name));
  }

  late final _$loadStonesAsyncAction =
      AsyncAction('StonesControllerBase.loadStones', context: context);

  @override
  Future<void> loadStones() {
    return _$loadStonesAsyncAction.run(() => super.loadStones());
  }

  late final _$addStoneAsyncAction =
      AsyncAction('StonesControllerBase.addStone', context: context);

  @override
  Future<void> addStone() {
    return _$addStoneAsyncAction.run(() => super.addStone());
  }

  late final _$editStoneAsyncAction =
      AsyncAction('StonesControllerBase.editStone', context: context);

  @override
  Future<void> editStone(StoneModel stoneModel) {
    return _$editStoneAsyncAction.run(() => super.editStone(stoneModel));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
