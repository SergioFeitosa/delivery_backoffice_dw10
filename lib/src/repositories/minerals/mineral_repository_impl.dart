// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/mineral_model.dart';
import 'mineral_repository.dart';

class MineralRepositoryImpl implements MineralRepository {
  final CustomDio _dio;

  MineralRepositoryImpl(this._dio);

  @override
  Future<void> deleteMineral(int id) async {
    try {
      await _dio.auth().put(
        '/minerals/$id',
        data: {'enabled': false},
      );
    // ignore: deprecated_member_use
    } on DioError catch (e, s) {
      log('Erro ao deletar produto', error: e, stackTrace: s);
      throw RepositoryException('Erro ao deletar produto');
    }
  }

  @override
  Future<List<MineralModel>> findAll(String? name) async {
    try {
      final mineralResult = await _dio.auth().get(
        '/minerals',
        queryParameters: {
          if (name != null) 'name': name,
          'enabled': true,
        },
      );
      return mineralResult.data
          .map<MineralModel>((p) => MineralModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException('Erro ao buscar produtos');
    }
  }

  @override
  Future<MineralModel> getMineral(int id) async {
    try {
      final mineralResult = await _dio.auth().get(
            '/minerals/$id',
          );

      return MineralModel.fromMap(mineralResult.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar produto $id', error: e, stackTrace: s);
      throw RepositoryException('Erro ao buscar produto $id');
    }
  }

  @override
  Future<void> save(MineralModel mineralModel) async {
    try {
      final client = _dio.auth();
      final data = mineralModel.toMap();

      if (mineralModel.id != null) {
        await client.put('/minerals/${mineralModel.id}', data: data);
      } else {
        await client.post('/minerals/}', data: data);
      }
    } on DioError catch (e, s) {
      log('Erro ao salvar produto', error: e, stackTrace: s);
      throw RepositoryException('Erro ao salvar produto');
    }
  }

  @override
  Future<String> uploadImageMineral(Uint8List file, String filename) async {
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
