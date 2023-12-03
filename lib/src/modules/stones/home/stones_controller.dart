import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../models/stone_model.dart';
import '../../../repositories/stones/stone_repository.dart';
part 'stones_controller.g.dart';

enum StoneStateStatus {
  initial,
  loading,
  loaded,
  error,
  addOrUpdateStone,
}

class StonesController = StonesControllerBase with _$StonesController;

abstract class StonesControllerBase with Store {
  final StoneRepository _stoneRepository;

  StonesControllerBase(this._stoneRepository);

  @readonly
  var _status = StoneStateStatus.initial;

  @readonly
  var _stones = <StoneModel>[];

  @readonly
  String? _filterName;

  @readonly
  StoneModel? _stoneSelected;

  @action
  Future<void> filterByName(String name) async {
    _filterName = name;
    await loadStones();
  }

  @action
  Future<void> loadStones() async {
    try {
      _status = StoneStateStatus.loading;
      _stones = await _stoneRepository.findAll(_filterName);
      _status = StoneStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar produtos', error: e, stackTrace: s);
      _status = StoneStateStatus.error;
    }
  }

  @action
  Future<void> addStone() async {
    _status = StoneStateStatus.loading;
    await Future.delayed(Duration.zero);
    _stoneSelected = null;
    _status = StoneStateStatus.addOrUpdateStone;
  }

  @action
  Future<void> editStone(StoneModel stoneModel) async {
    _status = StoneStateStatus.loading;
    await Future.delayed(Duration.zero);
    _stoneSelected = stoneModel;
    _status = StoneStateStatus.addOrUpdateStone;
  }
}
