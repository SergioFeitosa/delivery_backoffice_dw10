import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../models/mineral_model.dart';
import '../../../repositories/minerals/mineral_repository.dart';
part 'minerals_controller.g.dart';

enum MineralStateStatus {
  initial,
  loading,
  loaded,
  error,
  addOrUpdateMineral,
}

class MineralsController = MineralsControllerBase with _$MineralsController;

abstract class MineralsControllerBase with Store {
  final MineralRepository _mineralRepository;

  MineralsControllerBase(this._mineralRepository);

  @readonly
  var _status = MineralStateStatus.initial;

  @readonly
  var _minerals = <MineralModel>[];

  @readonly
  String? _filterName;

  @readonly
  MineralModel? _mineralSelected;

  @action
  Future<void> filterByName(String name) async {
    _filterName = name;
    await loadMinerals();
  }

  @action
  Future<void> loadMinerals() async {
    try {
      _status = MineralStateStatus.loading;
      _minerals = await _mineralRepository.findAll(_filterName);
      _status = MineralStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar produtos', error: e, stackTrace: s);
      _status = MineralStateStatus.error;
    }
  }

  @action
  Future<void> addMineral() async {
    _status = MineralStateStatus.loading;
    await Future.delayed(Duration.zero);
    _mineralSelected = null;
    _status = MineralStateStatus.addOrUpdateMineral;
  }

  @action
  Future<void> editMineral(MineralModel mineralModel) async {
    _status = MineralStateStatus.loading;
    await Future.delayed(Duration.zero);
    _mineralSelected = mineralModel;
    _status = MineralStateStatus.addOrUpdateMineral;
  }
}
