import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/helpers/debouncer.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/widgets/base_header.dart';
import 'stones_controller.dart';
import 'widgets/stone_item.dart';

class StonesPage extends StatefulWidget {
  const StonesPage({super.key});

  @override
  State<StonesPage> createState() => _StonesPageState();
}

class _StonesPageState extends State<StonesPage> with Loader, Messages {
  final controller = Modular.get<StonesController>();
  late final ReactionDisposer statusDisposer;
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case StoneStateStatus.initial:
            break;
          case StoneStateStatus.loading:
            showLoader();
            break;
          case StoneStateStatus.loaded:
            hideLoader();
            break;
          case StoneStateStatus.error:
            hideLoader();
            showError('Erro ao buscar pedras');
            break;
          case StoneStateStatus.addOrUpdateStone:
            hideLoader();
            final stoneSelected = controller.stoneSelected;
            var uri = '/stones/detail';

            if (stoneSelected != null) {
              uri += '?id=${stoneSelected.id}';  
            }

            await Modular.to.pushNamed(uri);
            controller.loadStones();

            break;
        }
      });
      controller.loadStones();
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
      child: Column(
        children: [
          BaseHeader(
            title: 'ADMINISTRAR PEDRAS',
            buttonLabel: 'ADICIONAR PEDRA',
            buttonPressed: () {
              controller.addStone();
              },
            searchChange: (value) {
              debouncer.call(() {
                controller.filterByName(value);
              });
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                return GridView.builder(
                  itemCount: controller.stones.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 280,
                    mainAxisSpacing: 20,
                    maxCrossAxisExtent: 280,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return StoneItem(stone: controller.stones[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
