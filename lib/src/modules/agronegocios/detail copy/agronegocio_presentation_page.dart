import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/extensions/formatter_extensions.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/styles/text_styles.dart';
import 'agronegocio_presentation_controller.dart';

class AgronegocioPresentationPage extends StatefulWidget {
  final int? agronegocioId;

  const AgronegocioPresentationPage({super.key, this.agronegocioId});

  @override
  State<AgronegocioPresentationPage> createState() => _AgronegocioPresentationPageState();
}

class _AgronegocioPresentationPageState extends State<AgronegocioPresentationPage>
    with Loader, Messages {
  final controller = Modular.get<AgronegocioPresentationController>();
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final priceEC = TextEditingController();
  final descriptionEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    priceEC.dispose();
    descriptionEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reaction((_) => controller.status, (status) {
        switch (status) {
          case AgronegocioPresentationStateStatus.initial:
            break;
          case AgronegocioPresentationStateStatus.loading:
            showLoader();
            break;
          case AgronegocioPresentationStateStatus.loaded:
            final model = controller.agronegocioModel!;
            nameEC.text = model.name;
            priceEC.text = model.price.currencyPTBR;
            descriptionEC.text = model.description;
            hideLoader();
            break;
          case AgronegocioPresentationStateStatus.error:
            hideLoader();
            showError(controller.errorMessage!);
            break;
          case AgronegocioPresentationStateStatus.errorLoadAgronegocio:
            hideLoader();
            showError('Erro ao carregar o produto para alteração');
            Navigator.of(context).pop();
            break;
          case AgronegocioPresentationStateStatus.uploaded:
            hideLoader();
            break;
          case AgronegocioPresentationStateStatus.deleted:
          case AgronegocioPresentationStateStatus.saved:
            hideLoader();
            Navigator.pop(context);
            break;
        }
      });
      controller.loadAgronegocio(widget.agronegocioId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(40),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Apresentar Agronegócio',
                      textAlign: TextAlign.center,
                      style: context.textStyles.textTitle.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
