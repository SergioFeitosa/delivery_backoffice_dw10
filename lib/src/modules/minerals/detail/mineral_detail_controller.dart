import 'dart:developer';
import 'dart:typed_data';

import 'package:mobx/mobx.dart';

import '../../../models/mineral_model.dart';
import '../../../repositories/minerals/mineral_repository.dart';
part 'mineral_detail_controller.g.dart';

enum MineralDetailStateStatus {
  initial,
  loading,
  loaded,
  error,
  errorLoadMineral,
  deleted,
  uploaded,
  saved,
}

class MineralDetailController = MineralDetailControllerBase
    with _$MineralDetailController;

abstract class MineralDetailControllerBase with Store {
  final MineralRepository _mineralRepository;

  @readonly
  var _status = MineralDetailStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  String? _imagePath;

  @readonly
  MineralModel? _mineralModel;

  MineralDetailControllerBase(this._mineralRepository);

  @action
  Future<void> uploadImageMineral(Uint8List file, String filename) async {
    _status = MineralDetailStateStatus.loading;
    _imagePath = await _mineralRepository.uploadImageMineral(file, filename);
    _status = MineralDetailStateStatus.uploaded;
  }

  @action
  Future<void> save(String name, double price, String description) async {
    try {
      _status = MineralDetailStateStatus.loading;

      final mineralModel = MineralModel(
        id: _mineralModel?.id,
        name: name,
        description: description,
        price: price,
        image: _imagePath!,
        enabled: _mineralModel?.enabled ?? true,
      );
      await _mineralRepository.save(mineralModel);
      _status = MineralDetailStateStatus.saved;
    } catch (e, s) {
      log('Erro ao salvar produto', error: e, stackTrace: s);
      _status = MineralDetailStateStatus.error;
      _errorMessage = 'Erro ao salvar o produto';
    }
  }

  @action
  Future<void> loadMineral(int? id) async {
    try {
      _status = MineralDetailStateStatus.loading;
      _mineralModel = null;
      _imagePath = null;

      if (id != null) {
        _mineralModel = await _mineralRepository.getMineral(id);
        _imagePath = _mineralModel!.image;
      }
      _status = MineralDetailStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar produto ', error: e, stackTrace: s);
      _status = MineralDetailStateStatus.errorLoadMineral;
    }
  }

  Future<void> deleteMineral() async {
    try {
      _status = MineralDetailStateStatus.loading;
      if (_mineralModel != null && _mineralModel!.id != null) {
        await _mineralRepository.deleteMineral(_mineralModel!.id!);
      _status = MineralDetailStateStatus.deleted;
      }
      await Future.delayed(Duration.zero);
      _status = MineralDetailStateStatus.error;
      _errorMessage = 'Produto não cadastrado'; 
    } catch (e, s) {
      log('Erro ao deletar produto ', error: e, stackTrace: s);
      _status = MineralDetailStateStatus.error;
      _errorMessage = 'Erro ao deletar produto';
    }
  }
}
