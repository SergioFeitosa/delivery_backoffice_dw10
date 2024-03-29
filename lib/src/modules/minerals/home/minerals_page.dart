import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/helpers/debouncer.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/widgets/base_header.dart';
import 'minerals_controller.dart';
import 'widgets/mineral_item.dart';

class MineralsPage extends StatefulWidget {
  const MineralsPage({super.key});

  @override
  State<MineralsPage> createState() => _MineralsPageState();
}

class _MineralsPageState extends State<MineralsPage> with Loader, Messages {
  final controller = Modular.get<MineralsController>();
  late final ReactionDisposer statusDisposer;
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case MineralStateStatus.initial:
            break;
          case MineralStateStatus.loading:
            showLoader();
            break;
          case MineralStateStatus.loaded:
            hideLoader();
            break;
          case MineralStateStatus.error:
            hideLoader();
            showError('Erro ao buscar minerais');
            break;
          case MineralStateStatus.addOrUpdateMineral:
            hideLoader();
            final mineralSelected = controller.mineralSelected;
            var uri = '/minerals/detail';

            if (mineralSelected != null) {
              uri += '?id=${mineralSelected.id}';  
            }

            await Modular.to.pushNamed(uri);
            controller.loadMinerals();

            break;
        }
      });
      controller.loadMinerals();
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
            title: 'ADMINISTRAR MINERAIS',
            buttonLabel: 'ADICIONAR MINERAL',
            buttonPressed: () {
              controller.addMineral();
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
                  itemCount: controller.minerals.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 280,
                    mainAxisSpacing: 20,
                    maxCrossAxisExtent: 280,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return MineralItem(mineral: controller.minerals[index]);
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
