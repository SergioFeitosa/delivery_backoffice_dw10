import 'package:flutter_modular/flutter_modular.dart';

import 'detail/company_detail_controller.dart';
import 'detail/company_detail_page.dart';
import 'home/companys_controller.dart';
import 'home/companys_page.dart';

class CompanysModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton(
      (i) => CompanysController(i()),
    ),
        Bind.lazySingleton(
      (i) => CompanyDetailController(i()),
    ),

    ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const CompanysPage()),
        ChildRoute(
          '/detail',
          child: (context, args) => CompanyDetailPage(
            companyId: int.tryParse(args.queryParams['id'] ?? 'não informado'),
          ),
        ),
      ];
}
