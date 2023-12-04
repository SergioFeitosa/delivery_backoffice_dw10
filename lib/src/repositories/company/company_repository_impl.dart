import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/company_model.dart';
import 'company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CustomDio _dio;

  CompanyRepositoryImpl(this._dio);

  @override
  Future<void> deleteCompany(int id) async {
    try {
      await _dio.auth().put(
        '/companys/$id',
        data: {'enabled': false},
      );
    // ignore: deprecated_member_use
    } on DioError catch (e, s) {
      log('Erro ao deletar empresa', error: e, stackTrace: s);
      throw RepositoryException('Erro ao deletar empresa');
    }
  }

  @override
  Future<List<CompanyModel>> findAll(String? name) async {
    try {
      final companyResult = await _dio.auth().get(
        '/companys',
        queryParameters: {
          if (name != null) 'name': name,
          'enabled': true,
        },
      );
      return companyResult.data
          .map<CompanyModel>((p) => CompanyModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar empresas', error: e, stackTrace: s);
      throw RepositoryException('Erro ao buscar empresas');
    }
  }

  @override
  Future<CompanyModel> getCompany(int id) async {
    try {
      final companyResult = await _dio.auth().get(
            '/companys/$id',
          );

      return CompanyModel.fromMap(companyResult.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar produto $id', error: e, stackTrace: s);
      throw RepositoryException('Erro ao buscar empresa $id');
    }
  }

  @override
  Future<void> save(CompanyModel companyModel) async {
    try {
      final client = _dio.auth();
      final data = companyModel.toMap();

      if (companyModel.id != null) {
        await client.put('/companys/${companyModel.id}', data: data);
      } else {
        await client.post('/companys/}', data: data);
      }
    } on DioError catch (e, s) {
      log('Erro ao salvar empresa', error: e, stackTrace: s);
      throw RepositoryException('Erro ao salvar empresa');
    }
  }

  @override
  Future<String> uploadImageCompany(Uint8List file, String filename) async {
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
