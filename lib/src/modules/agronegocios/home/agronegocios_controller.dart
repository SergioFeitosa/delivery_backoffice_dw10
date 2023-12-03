import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../models/agronegocio_model.dart';
import '../../../repositories/agronegocios/agronegocio_repository.dart';

part 'agronegocios_controller.g.dart';

enum AgronegocioStateStatus {
  initial,
  loading,
  loaded,
  error,
  addOrUpdateAgronegocio,
}

class AgronegociosController = AgronegociosControllerBase with _$AgronegociosController;

abstract class AgronegociosControllerBase with Store {
  final AgronegocioRepository _agronegocioRepository;

  AgronegociosControllerBase(this._agronegocioRepository);

  @readonly
  var _status = AgronegocioStateStatus.initial;

  @readonly
  var _agronegocios = <AgronegocioModel>[];

  @readonly
  String? _filterName;

  @readonly
  AgronegocioModel? _agronegocioSelected;

  @action
  Future<void> filterByName(String name) async {
    _filterName = name;
    await loadAgronegocios();
  }

  @action
  Future<void> loadAgronegocios() async {
    try {
      _status = AgronegocioStateStatus.loading;
      _agronegocios = await _agronegocioRepository.findAll(_filterName);
      _status = AgronegocioStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar produtos', error: e, stackTrace: s);
      _status = AgronegocioStateStatus.error;
    }
  }

  @action
  Future<void> addAgronegocio() async {
    _status = AgronegocioStateStatus.loading;
    await Future.delayed(Duration.zero);
    _agronegocioSelected = null;
    _status = AgronegocioStateStatus.addOrUpdateAgronegocio;
  }

  @action
  Future<void> editAgronegocio(AgronegocioModel agronegocioModel) async {
    _status = AgronegocioStateStatus.loading;
    await Future.delayed(Duration.zero);
    _agronegocioSelected = agronegocioModel;
    _status = AgronegocioStateStatus.addOrUpdateAgronegocio;
  }
}
