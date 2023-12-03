import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../models/company_model.dart';
import '../../../repositories/company/company_repository.dart';

part 'companys_controller.g.dart';

enum CompanyStateStatus {
  initial,
  loading,
  loaded,
  error,
  addOrUpdateCompany,
}

class CompanysController = CompanysControllerBase with _$CompanysController;

abstract class CompanysControllerBase with Store {
  final CompanyRepository _companyRepository;

  CompanysControllerBase(this._companyRepository);

  @readonly
  var _status = CompanyStateStatus.initial;

  @readonly
  var _companys = <CompanyModel>[];

  @readonly
  String? _filterName;

  @readonly
  CompanyModel? _companySelected;

  @action
  Future<void> filterByName(String name) async {
    _filterName = name;
    await loadCompanys();
  }

  @action
  Future<void> loadCompanys() async {
    try {
      _status = CompanyStateStatus.loading;
      _companys = await _companyRepository.findAll(_filterName);
      _status = CompanyStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar empresas', error: e, stackTrace: s);
      _status = CompanyStateStatus.error;
    }
  }

  @action
  Future<void> addCompany() async {
    _status = CompanyStateStatus.loading;
    await Future.delayed(Duration.zero);
    _companySelected = null;
    _status = CompanyStateStatus.addOrUpdateCompany;
  }

  @action
  Future<void> editCompany(CompanyModel companyModel) async {
    _status = CompanyStateStatus.loading;
    await Future.delayed(Duration.zero);
    _companySelected = companyModel;
    _status = CompanyStateStatus.addOrUpdateCompany;
  }
}
