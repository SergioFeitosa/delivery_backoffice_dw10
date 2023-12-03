import 'dart:typed_data';

import '../../models/company_model.dart';

abstract class CompanyRepository {

  Future<List<CompanyModel>> findAll(String? name);

  Future<CompanyModel> getCompany(int id);

  Future<void> save(CompanyModel companyModel);

  Future<String> uploadImageCompany(Uint8List file, String filename);

  Future<void> deleteCompany(int id);
}