import 'package:flutter_modular/flutter_modular.dart';

import 'detail/stone_detail_controller.dart';
import 'detail/stone_detail_page.dart';
import 'home/stones_controller.dart';
import 'home/stones_page.dart';

class StonesModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton(
      (i) => StonesController(i()),
    ),
        Bind.lazySingleton(
      (i) => StoneDetailController(i()),
    ),

    ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const StonesPage()),
        ChildRoute(
          '/detail',
          child: (context, args) => StoneDetailPage(
            stoneId: int.tryParse(args.queryParams['id'] ?? 'não informado'),
          ),
        ),
      ];
}
