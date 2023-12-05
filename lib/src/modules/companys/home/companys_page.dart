import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/helpers/debouncer.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/widgets/base_header.dart';
import 'companys_controller.dart';
import 'widgets/company_item.dart';

class CompanysPage extends StatefulWidget {
  const CompanysPage({super.key});

  @override
  State<CompanysPage> createState() => _CompanysPageState();
}

class _CompanysPageState extends State<CompanysPage> with Loader, Messages {
  final controller = Modular.get<CompanysController>();
  late final ReactionDisposer statusDisposer;
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case CompanyStateStatus.initial:
            break;
          case CompanyStateStatus.loading:
            showLoader();
            break;
          case CompanyStateStatus.loaded:
            hideLoader();
            break;
          case CompanyStateStatus.error:
            hideLoader();
            showError('Erro ao buscar empresas');
            break;
          case CompanyStateStatus.addOrUpdateCompany:
            hideLoader();
            final companySelected = controller.companySelected;
            var uri = '/companys/detail';

            if (companySelected != null) {
              uri += '?id=${companySelected.id}';  
            }

            await Modular.to.pushNamed(uri);
            controller.loadCompanys();

            break;
        }
      });
      controller.loadCompanys();
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
            title: 'ADMINISTRAR EMPRESAS',
            buttonLabel: 'ADICIONAR EMPRESA',
            buttonPressed: () {
              controller.addCompany();
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
                  itemCount: controller.companys.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 280,
                    mainAxisSpacing: 20,
                    maxCrossAxisExtent: 280,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return CompanyItem(company: controller.companys[index]);
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
