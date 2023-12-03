// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agronegocios_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AgronegociosController on AgronegociosControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'AgronegociosControllerBase._status', context: context);

  AgronegocioStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  AgronegocioStateStatus get _status => status;

  @override
  set _status(AgronegocioStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_agronegociosAtom =
      Atom(name: 'AgronegociosControllerBase._agronegocios', context: context);

  List<AgronegocioModel> get agronegocios {
    _$_agronegociosAtom.reportRead();
    return super._agronegocios;
  }

  @override
  List<AgronegocioModel> get _agronegocios => agronegocios;

  @override
  set _agronegocios(List<AgronegocioModel> value) {
    _$_agronegociosAtom.reportWrite(value, super._agronegocios, () {
      super._agronegocios = value;
    });
  }

  late final _$_filterNameAtom =
      Atom(name: 'AgronegociosControllerBase._filterName', context: context);

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

  late final _$_agronegocioSelectedAtom =
      Atom(name: 'AgronegociosControllerBase._agronegocioSelected', context: context);

  AgronegocioModel? get agronegocioSelected {
    _$_agronegocioSelectedAtom.reportRead();
    return super._agronegocioSelected;
  }

  @override
  AgronegocioModel? get _agronegocioSelected => agronegocioSelected;

  @override
  set _agronegocioSelected(AgronegocioModel? value) {
    _$_agronegocioSelectedAtom.reportWrite(value, super._agronegocioSelected, () {
      super._agronegocioSelected = value;
    });
  }

  late final _$filterByNameAsyncAction =
      AsyncAction('AgronegociosControllerBase.filterByName', context: context);

  @override
  Future<void> filterByName(String name) {
    return _$filterByNameAsyncAction.run(() => super.filterByName(name));
  }

  late final _$loadAgronegociosAsyncAction =
      AsyncAction('AgronegociosControllerBase.loadAgronegocios', context: context);

  @override
  Future<void> loadAgronegocios() {
    return _$loadAgronegociosAsyncAction.run(() => super.loadAgronegocios());
  }

  late final _$addAgronegocioAsyncAction =
      AsyncAction('AgronegociosControllerBase.addAgronegocio', context: context);

  @override
  Future<void> addAgronegocio() {
    return _$addAgronegocioAsyncAction.run(() => super.addAgronegocio());
  }

  late final _$editAgronegocioAsyncAction =
      AsyncAction('AgronegociosControllerBase.editAgronegocio', context: context);

  @override
  Future<void> editAgronegocio(AgronegocioModel agronegocioModel) {
    return _$editAgronegocioAsyncAction.run(() => super.editAgronegocio(agronegocioModel));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
