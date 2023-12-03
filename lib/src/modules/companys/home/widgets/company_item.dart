// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/env/env.dart';
import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/company_model.dart';
import '../companys_controller.dart';

class CompanyItem extends StatelessWidget {

  final CompanyModel company;

  const CompanyItem({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: constraints.maxHeight * .6,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),),
                  image: DecorationImage(
                      image: NetworkImage(
                        '${Env.instance.get('backend_base_url')}${company.image}',
                      ),
                      fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Tooltip(
                  message: company.name,
                  child: Text(
                    company.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.textMedium,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(company.price.currencyPTBR,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<CompanysController>().editCompany(company);
                    },
                    child: const Text('Editar'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
