import 'dart:typed_data';

import '../../models/stone_model.dart';

abstract class StoneRepository {

  Future<List<StoneModel>> findAll(String? name);

  Future<StoneModel> getStone(int id);

  Future<void> save(StoneModel stoneModel);

  Future<String> uploadImageStone(Uint8List file, String filename);

  Future<void> deleteStone(int id);
}