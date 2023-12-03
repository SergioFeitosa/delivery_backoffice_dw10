import 'package:flutter_modular/flutter_modular.dart';

import 'detail/mineral_detail_controller.dart';
import 'detail/mineral_detail_page.dart';
import 'home/minerals_controller.dart';
import 'home/minerals_page.dart';

class MineralsModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton(
      (i) => MineralsController(i()),
    ),
        Bind.lazySingleton(
      (i) => MineralDetailController(i()),
    ),

    ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const MineralsPage()),
        ChildRoute(
          '/detail',
          child: (context, args) => MineralDetailPage(
            mineralId: int.tryParse(args.queryParams['id'] ?? 'não informado'),
          ),
        ),
      ];
}
