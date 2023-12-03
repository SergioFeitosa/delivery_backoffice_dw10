import 'dart:developer';
import 'dart:typed_data';

import 'package:mobx/mobx.dart';

import '../../../models/stone_model.dart';
import '../../../repositories/stones/stone_repository.dart';
part 'stone_detail_controller.g.dart';

enum StoneDetailStateStatus {
  initial,
  loading,
  loaded,
  error,
  errorLoadStone,
  deleted,
  uploaded,
  saved,
}

class StoneDetailController = StoneDetailControllerBase
    with _$StoneDetailController;

abstract class StoneDetailControllerBase with Store {
  final StoneRepository _stoneRepository;

  @readonly
  var _status = StoneDetailStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  String? _imagePath;

  @readonly
  StoneModel? _stoneModel;

  StoneDetailControllerBase(this._stoneRepository);

  @action
  Future<void> uploadImageStone(Uint8List file, String filename) async {
    _status = StoneDetailStateStatus.loading;
    _imagePath = await _stoneRepository.uploadImageStone(file, filename);
    _status = StoneDetailStateStatus.uploaded;
  }

  @action
  Future<void> save(String name, double price, String description) async {
    try {
      _status = StoneDetailStateStatus.loading;

      final stoneModel = StoneModel(
        id: _stoneModel?.id,
        name: name,
        description: description,
        price: price,
        image: _imagePath!,
        enabled: _stoneModel?.enabled ?? true,
      );
      await _stoneRepository.save(stoneModel);
      _status = StoneDetailStateStatus.saved;
    } catch (e, s) {
      log('Erro ao salvar pedra', error: e, stackTrace: s);
      _status = StoneDetailStateStatus.error;
      _errorMessage = 'Erro ao salvar o pedra';
    }
  }

  @action
  Future<void> loadStone(int? id) async {
    try {
      _status = StoneDetailStateStatus.loading;
      _stoneModel = null;
      _imagePath = null;

      if (id != null) {
        _stoneModel = await _stoneRepository.getStone(id);
        _imagePath = _stoneModel!.image;
      }
      _status = StoneDetailStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar pedra ', error: e, stackTrace: s);
      _status = StoneDetailStateStatus.errorLoadStone;
    }
  }

  Future<void> deleteStone() async {
    try {
      _status = StoneDetailStateStatus.loading;
      if (_stoneModel != null && _stoneModel!.id != null) {
        await _stoneRepository.deleteStone(_stoneModel!.id!);
      _status = StoneDetailStateStatus.deleted;
      }
      await Future.delayed(Duration.zero);
      _status = StoneDetailStateStatus.error;
      _errorMessage = 'Pedra não cadastrada'; 
    } catch (e, s) {
      log('Erro ao deletar pedra ', error: e, stackTrace: s);
      _status = StoneDetailStateStatus.error;
      _errorMessage = 'Erro ao deletar pedra';
    }
  }
}
