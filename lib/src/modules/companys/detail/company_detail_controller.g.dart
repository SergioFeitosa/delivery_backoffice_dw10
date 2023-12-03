// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompanyDetailController on CompanyDetailControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'CompanyDetailControllerBase._status', context: context);

  CompanyDetailStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  CompanyDetailStateStatus get _status => status;

  @override
  set _status(CompanyDetailStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'CompanyDetailControllerBase._errorMessage', context: context);

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
      Atom(name: 'CompanyDetailControllerBase._imagePath', context: context);

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

  late final _$_companyModelAtom =
      Atom(name: 'CompanyDetailControllerBase._companyModel', context: context);

  CompanyModel? get companyModel {
    _$_companyModelAtom.reportRead();
    return super._companyModel;
  }

  @override
  CompanyModel? get _companyModel => companyModel;

  @override
  set _companyModel(CompanyModel? value) {
    _$_companyModelAtom.reportWrite(value, super._companyModel, () {
      super._companyModel = value;
    });
  }

  late final _$uploadImageCompanyAsyncAction = AsyncAction(
      'CompanyDetailControllerBase.uploadImageCompany',
      context: context,);

  @override
  Future<void> uploadImageCompany(Uint8List file, String filename) {
    return _$uploadImageCompanyAsyncAction
        .run(() => super.uploadImageCompany(file, filename));
  }

  late final _$saveAsyncAction =
      AsyncAction('CompanyDetailControllerBase.save', context: context);

  @override
  Future<void> save(String name, double price, String description) {
    return _$saveAsyncAction.run(() => super.save(name, price, description));
  }

  late final _$loadCompanyAsyncAction =
      AsyncAction('CompanyDetailControllerBase.loadCompany', context: context);

  @override
  Future<void> loadCompany(int? id) {
    return _$loadCompanyAsyncAction.run(() => super.loadCompany(id));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
