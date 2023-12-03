import 'package:flutter_modular/flutter_modular.dart';

import 'detail/agronegocio_detail_controller.dart';
import 'detail/agronegocio_detail_page.dart';
import 'home/agronegocios_controller.dart';
import 'home/agronegocios_page.dart';

class AgronegociosModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton(
      (i) => AgronegociosController(i()),
    ),
        Bind.lazySingleton(
      (i) => AgronegocioDetailController(i()),
    ),

    ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AgronegociosPage()),
        ChildRoute(
          '/detail',
          child: (context, args) => AgronegocioDetailPage(
            agronegocioId: int.tryParse(args.queryParams['id'] ?? 'não informado'),
          ),
        ),
      ];
}
