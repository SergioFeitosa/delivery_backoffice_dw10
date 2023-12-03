// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/env/env.dart';
import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/stone_model.dart';
import '../stones_controller.dart';

class StoneItem extends StatelessWidget {

  final StoneModel stone;

  const StoneItem({
    super.key,
    required this.stone,
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
                        '${Env.instance.get('backend_base_url')}${stone.image}',
                      ),
                      fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Tooltip(
                  message: stone.name,
                  child: Text(
                    stone.name,
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
                    child: Text(stone.price.currencyPTBR,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<StonesController>().editStone(stone);
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
