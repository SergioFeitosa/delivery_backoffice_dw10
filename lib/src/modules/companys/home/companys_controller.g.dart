// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companys_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompanysController on CompanysControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'CompanysControllerBase._status', context: context);

  CompanyStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  CompanyStateStatus get _status => status;

  @override
  set _status(CompanyStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_companysAtom =
      Atom(name: 'CompanysControllerBase._companys', context: context);

  List<CompanyModel> get companys {
    _$_companysAtom.reportRead();
    return super._companys;
  }

  @override
  List<CompanyModel> get _companys => companys;

  @override
  set _companys(List<CompanyModel> value) {
    _$_companysAtom.reportWrite(value, super._companys, () {
      super._companys = value;
    });
  }

  late final _$_filterNameAtom =
      Atom(name: 'CompanysControllerBase._filterName', context: context);

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

  late final _$_companySelectedAtom =
      Atom(name: 'CompanysControllerBase._companySelected', context: context);

  CompanyModel? get companySelected {
    _$_companySelectedAtom.reportRead();
    return super._companySelected;
  }

  @override
  CompanyModel? get _companySelected => companySelected;

  @override
  set _companySelected(CompanyModel? value) {
    _$_companySelectedAtom.reportWrite(value, super._companySelected, () {
      super._companySelected = value;
    });
  }

  late final _$filterByNameAsyncAction =
      AsyncAction('CompanysControllerBase.filterByName', context: context);

  @override
  Future<void> filterByName(String name) {
    return _$filterByNameAsyncAction.run(() => super.filterByName(name));
  }

  late final _$loadCompanysAsyncAction =
      AsyncAction('CompanysControllerBase.loadCompanys', context: context);

  @override
  Future<void> loadCompanys() {
    return _$loadCompanysAsyncAction.run(() => super.loadCompanys());
  }

  late final _$addCompanyAsyncAction =
      AsyncAction('CompanysControllerBase.addCompany', context: context);

  @override
  Future<void> addCompany() {
    return _$addCompanyAsyncAction.run(() => super.addCompany());
  }

  late final _$editCompanyAsyncAction =
      AsyncAction('CompanysControllerBase.editCompany', context: context);

  @override
  Future<void> editCompany(CompanyModel companyModel) {
    return _$editCompanyAsyncAction.run(() => super.editCompany(companyModel));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
