// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/stone_model.dart';
import 'stone_repository.dart';

class StoneRepositoryImpl implements StoneRepository {
  final CustomDio _dio;

  StoneRepositoryImpl(this._dio);

  @override
  Future<void> deleteStone(int id) async {
    try {
      await _dio.auth().put(
        '/stones/$id',
        data: {'enabled': false},
      );
    // ignore: deprecated_member_use
    } on DioError catch (e, s) {
      log('Erro ao deletar pedra', error: e, stackTrace: s);
      throw RepositoryException('Erro ao deletar pedra');
    }
  }

  @override
  Future<List<StoneModel>> findAll(String? name) async {
    try {
      final stoneResult = await _dio.auth().get(
        '/stones',
        queryParameters: {
          if (name != null) 'name': name,
          'enabled': true,
        },
      );
      return stoneResult.data
          .map<StoneModel>((p) => StoneModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar pedras', error: e, stackTrace: s);
      throw RepositoryException('Erro ao buscar pedras');
    }
  }

  @override
  Future<StoneModel> getStone(int id) async {
    try {
      final stoneResult = await _dio.auth().get(
            '/stones/$id',
          );

      return StoneModel.fromMap(stoneResult.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar pedra $id', error: e, stackTrace: s);
      throw RepositoryException('Erro ao buscar pedra $id');
    }
  }

  @override
  Future<void> save(StoneModel stoneModel) async {
    try {
      final client = _dio.auth();
      final data = stoneModel.toMap();

      if (stoneModel.id != null) {
        await client.put('/stones/${stoneModel.id}', data: data);
      } else {
        await client.post('/stones/}', data: data);
      }
    } on DioError catch (e, s) {
      log('Erro ao salvar pedra', error: e, stackTrace: s);
      throw RepositoryException('Erro ao salvar pedra');
    }
  }

  @override
  Future<String> uploadImageStone(Uint8List file, String filename) async {
    try {
      final formData = FormData.fromMap(
        {
          'file': MultipartFile.fromBytes(file, filename: filename),
        },
      );
      final response = await _dio.auth().post('/uploads', data: formData);
      return response.data['url'];
    } on DioError catch (e, s) {
      log('Erro ao fazer upload do arquivo', error: e, stackTrace: s);
      throw RepositoryException('Erro ao fazer upload do arquivo');
    }
  }
}
