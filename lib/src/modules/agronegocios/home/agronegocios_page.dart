import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/helpers/debouncer.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/widgets/base_header.dart';
import 'agronegocios_controller.dart';
import 'widgets/agronegocio_item.dart';

class AgronegociosPage extends StatefulWidget {
  const AgronegociosPage({Key? key}) : super(key: key);

  @override
  State<AgronegociosPage> createState() => _AgronegociosPageState();
}

class _AgronegociosPageState extends State<AgronegociosPage> with Loader, Messages {
  final controller = Modular.get<AgronegociosController>();
  late final ReactionDisposer statusDisposer;
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case AgronegocioStateStatus.initial:
            break;
          case AgronegocioStateStatus.loading:
            showLoader();
            break;
          case AgronegocioStateStatus.loaded:
            hideLoader();
            break;
          case AgronegocioStateStatus.error:
            hideLoader();
            showError('Erro ao buscar Agronegócio');
            break;
          case AgronegocioStateStatus.addOrUpdateAgronegocio:
            hideLoader();
            final agronegocioSelected = controller.agronegocioSelected;
            var uri = '/agronegocios/detail';

            if (agronegocioSelected != null) {
              uri += '?id=${agronegocioSelected.id}';  
            }

            await Modular.to.pushNamed(uri);
            controller.loadAgronegocios();

            break;
        }
      });
      controller.loadAgronegocios();
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
            title: 'ADMINISTRAR AGRONEGÓCIO',
            buttonLabel: 'ADICIONAR AGRONEGÓCIO',
            buttonPressed: () {
              controller.addAgronegocio();
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
                  itemCount: controller.agronegocios.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 280,
                    mainAxisSpacing: 20,
                    maxCrossAxisExtent: 280,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return AgronegocioItem(agronegocio: controller.agronegocios[index]);
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
