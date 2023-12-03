import 'dart:developer';
import 'dart:typed_data';

import 'package:mobx/mobx.dart';

import '../../../models/company_model.dart';
import '../../../repositories/company/company_repository.dart';
part 'company_detail_controller.g.dart';

enum CompanyDetailStateStatus {
  initial,
  loading,
  loaded,
  error,
  errorLoadCompany,
  deleted,
  uploaded,
  saved,
}

class CompanyDetailController = CompanyDetailControllerBase
    with _$CompanyDetailController;

abstract class CompanyDetailControllerBase with Store {
  final CompanyRepository _companyRepository;

  @readonly
  var _status = CompanyDetailStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  String? _imagePath;

  @readonly
  CompanyModel? _companyModel;

  CompanyDetailControllerBase(this._companyRepository);

  @action
  Future<void> uploadImageCompany(Uint8List file, String filename) async {
    _status = CompanyDetailStateStatus.loading;
    _imagePath = await _companyRepository.uploadImageCompany(file, filename);
    _status = CompanyDetailStateStatus.uploaded;
  }

  @action
  Future<void> save(String name, double price, String description) async {
    try {
      _status = CompanyDetailStateStatus.loading;

      final companyModel = CompanyModel(
        id: _companyModel?.id,
        name: name,
        description: description,
        price: price,
        image: _imagePath!,
        enabled: _companyModel?.enabled ?? true,
      );
      await _companyRepository.save(companyModel);
      _status = CompanyDetailStateStatus.saved;
    } catch (e, s) {
      log('Erro ao salvar  empresa', error: e, stackTrace: s);
      _status = CompanyDetailStateStatus.error;
      _errorMessage = 'Erro ao salvar empresa';
    }
  }

  @action
  Future<void> loadCompany(int? id) async {
    try {
      _status = CompanyDetailStateStatus.loading;
      _companyModel = null;
      _imagePath = null;

      if (id != null) {
        _companyModel = await _companyRepository.getCompany(id);
        _imagePath = _companyModel!.image;
      }
      _status = CompanyDetailStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar empresa ', error: e, stackTrace: s);
      _status = CompanyDetailStateStatus.errorLoadCompany;
    }
  }

  Future<void> deleteCompany() async {
    try {
      _status = CompanyDetailStateStatus.loading;
      if (_companyModel != null && _companyModel!.id != null) {
        await _companyRepository.deleteCompany(_companyModel!.id!);
      _status = CompanyDetailStateStatus.deleted;
      }
      await Future.delayed(Duration.zero);
      _status = CompanyDetailStateStatus.error;
      _errorMessage = 'Empresa não cadastrada'; 
    } catch (e, s) {
      log('Erro ao deletar empresa ', error: e, stackTrace: s);
      _status = CompanyDetailStateStatus.error;
      _errorMessage = 'Erro ao deletar empresa';
    }
  }
}
