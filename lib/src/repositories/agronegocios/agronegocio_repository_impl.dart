import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/agronegocio_model.dart';
import 'agronegocio_repository.dart';

class AgronegocioRepositoryImpl implements AgronegocioRepository {
  final CustomDio _dio;

  AgronegocioRepositoryImpl(this._dio);

  @override
  Future<void> deleteAgronegocio(int id) async {
    try {
      await _dio.auth().put(
        '/agronegocios/$id',
        data: {'enabled': false},
      );
    // ignore: deprecated_member_use
    } on DioError catch (e, s) {
      log('Erro ao deletar produto', error: e, stackTrace: s);
      throw RepositoryException('Erro ao deletar produto');
    }
  }

  @override
  Future<List<AgronegocioModel>> findAll(String? name) async {
    try {
      final agronegocioResult = await _dio.auth().get(
        '/agronegocios',
        queryParameters: {
          if (name != null) 'name': name,
          'enabled': true,
        },
      );
      return agronegocioResult.data
          .map<AgronegocioModel>((p) => AgronegocioModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException('Erro ao buscar produtos');
    }
  }

  @override
  Future<AgronegocioModel> getAgronegocio(int id) async {
    try {
      final agronegocioResult = await _dio.auth().get(
            '/agronegocios/$id',
          );

      return AgronegocioModel.fromMap(agronegocioResult.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar produto $id', error: e, stackTrace: s);
      throw RepositoryException('Erro ao buscar produto $id');
    }
  }

  @override
  Future<void> save(AgronegocioModel agronegocioModel) async {
    try {
      final client = _dio.auth();
      final data = agronegocioModel.toMap();

      if (agronegocioModel.id != null) {
        await client.put('/agronegocios/${agronegocioModel.id}', data: data);
      } else {
        await client.post('/agronegocios/}', data: data);
      }
    } on DioError catch (e, s) {
      log('Erro ao salvar produto', error: e, stackTrace: s);
      throw RepositoryException('Erro ao salvar produto');
    }
  }

  @override
  Future<String> uploadImageAgronegocio(Uint8List file, String filename) async {
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
