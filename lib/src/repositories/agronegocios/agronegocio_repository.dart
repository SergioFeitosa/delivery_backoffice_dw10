import 'dart:typed_data';

import '../../models/agronegocio_model.dart';

abstract class AgronegocioRepository {

  Future<List<AgronegocioModel>> findAll(String? name);

  Future<AgronegocioModel> getAgronegocio(int id);

  Future<void> save(AgronegocioModel agronegocioModel);

  Future<String> uploadImageAgronegocio(Uint8List file, String filename);

  Future<void> deleteAgronegocio(int id);
}