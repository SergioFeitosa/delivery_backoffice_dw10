import 'dart:developer';
import 'dart:typed_data';

import 'package:mobx/mobx.dart';

import '../../../models/agronegocio_model.dart';
import '../../../repositories/agronegocios/agronegocio_repository.dart';
part 'agronegocio_presentation_controller.g.dart';

enum AgronegocioPresentationStateStatus {
  initial,
  loading,
  loaded,
  error,
  errorLoadAgronegocio,
  deleted,
  uploaded,
  saved,
}

class AgronegocioPresentationController = AgronegocioPresentationControllerBase
    with _$AgronegocioPresentationController;

abstract class AgronegocioPresentationControllerBase with Store {
  final AgronegocioRepository _agronegocioRepository;

  @readonly
  var _status = AgronegocioPresentationStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  String? _imagePath;

  @readonly
  AgronegocioModel? _agronegocioModel;

  AgronegocioPresentationControllerBase(this._agronegocioRepository);

  @action
  Future<void> uploadImageAgronegocio(Uint8List file, String filename) async {
    _status = AgronegocioPresentationStateStatus.loading;
    _imagePath = await _agronegocioRepository.uploadImageAgronegocio(file, filename);
    _status = AgronegocioPresentationStateStatus.uploaded;
  }

  @action
  Future<void> save(String name, double price, String description) async {
    try {
      _status = AgronegocioPresentationStateStatus.loading;

      final agronegocioModel = AgronegocioModel(
        id: _agronegocioModel?.id,
        name: name,
        description: description,
        price: price,
        image: _imagePath!,
        enabled: _agronegocioModel?.enabled ?? true,
      );
      await _agronegocioRepository.save(agronegocioModel);
      _status = AgronegocioPresentationStateStatus.saved;
    } catch (e, s) {
      log('Erro ao salvar produto', error: e, stackTrace: s);
      _status = AgronegocioPresentationStateStatus.error;
      _errorMessage = 'Erro ao salvar o produto';
    }
  }

  @action
  Future<void> loadAgronegocio(int? id) async {
    try {
      _status = AgronegocioPresentationStateStatus.loading;
      _agronegocioModel = null;
      _imagePath = null;

      if (id != null) {
        _agronegocioModel = await _agronegocioRepository.getAgronegocio(id);
        _imagePath = _agronegocioModel!.image;
      }
      _status = AgronegocioPresentationStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar produto ', error: e, stackTrace: s);
      _status = AgronegocioPresentationStateStatus.errorLoadAgronegocio;
    }
  }

  Future<void> deleteAgronegocio() async {
    try {
      _status = AgronegocioPresentationStateStatus.loading;
      if (_agronegocioModel != null && _agronegocioModel!.id != null) {
        await _agronegocioRepository.deleteAgronegocio(_agronegocioModel!.id!);
      _status = AgronegocioPresentationStateStatus.deleted;
      }
      await Future.delayed(Duration.zero);
      _status = AgronegocioPresentationStateStatus.error;
      _errorMessage = 'Produto não cadastrado'; 
    } catch (e, s) {
      log('Erro ao deletar produto ', error: e, stackTrace: s);
      _status = AgronegocioPresentationStateStatus.error;
      _errorMessage = 'Erro ao deletar produto';
    }
  }
}
