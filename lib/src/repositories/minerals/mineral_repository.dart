import 'dart:typed_data';

import '../../models/mineral_model.dart';

abstract class MineralRepository {

  Future<List<MineralModel>> findAll(String? name);

  Future<MineralModel> getMineral(int id);

  Future<void> save(MineralModel mineralModel);

  Future<String> uploadImageMineral(Uint8List file, String filename);

  Future<void> deleteMineral(int id);
}