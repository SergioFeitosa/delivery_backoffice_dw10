import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/env/env.dart';
import '../../../core/extensions/formatter_extensions.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/helpers/upload_html_helper.dart';
import '../../../core/ui/styles/text_styles.dart';
import 'agronegocio_detail_controller.dart';

class AgronegocioDetailPage extends StatefulWidget {
  final int? agronegocioId;

  const AgronegocioDetailPage({super.key, this.agronegocioId});

  @override
  State<AgronegocioDetailPage> createState() => _AgronegocioDetailPageState();
}

class _AgronegocioDetailPageState extends State<AgronegocioDetailPage>
    with Loader, Messages {
  final controller = Modular.get<AgronegocioDetailController>();
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
          case AgronegocioDetailStateStatus.initial:
            break;
          case AgronegocioDetailStateStatus.loading:
            showLoader();
            break;
          case AgronegocioDetailStateStatus.loaded:
            final model = controller.agronegocioModel!;
            nameEC.text = model.name;
            priceEC.text = model.price.currencyPTBR;
            descriptionEC.text = model.description;
            hideLoader();
            break;
          case AgronegocioDetailStateStatus.error:
            hideLoader();
            showError(controller.errorMessage!);
            break;
          case AgronegocioDetailStateStatus.errorLoadAgronegocio:
            hideLoader();
            showError('Erro ao carregar o produto para alteração');
            Navigator.of(context).pop();
            break;
          case AgronegocioDetailStateStatus.uploaded:
            hideLoader();
            break;
          case AgronegocioDetailStateStatus.deleted:
          case AgronegocioDetailStateStatus.saved:
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
    final widgetButtonAction = context.percentWidth(.4);
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
                      '${widget.agronegocioId != null ? 'Alterar' : 'Adicionar'} Agronegócio',
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
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Observer(
                        builder: (_) {
                          if (controller.imagePath != null) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                '${Env.instance.get('backend_base_url')}${controller.imagePath}',
                                width: 200,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            UploadHtmlHelper().startUpload(
                              controller.uploadImageAgronegocio,
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.9),
                          ),
                          child: Observer(
                            builder: (_) {
                              return Text(
                                '${controller.imagePath == null ? 'Adicionar' : 'Alterar'} Foto',
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Nome obrigatório'),
                            Validatorless.min(
                              5,
                              'Nome deve ter no mínimo 5 caracteres',
                            ),
                          ]),
                          decoration:
                              const InputDecoration(label: Text('Nome')),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: priceEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Preço obrigatório'),
                            Validatorless.min(
                              1,
                              'Preço ser no mínimo R\$ 1,00 caracteres',
                            ),
                          ]),
                          decoration:
                              const InputDecoration(label: Text('Preço')),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CentavosInputFormatter(moeda: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descriptionEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Descrição obrigatória'),
                  Validatorless.min(
                    5,
                    'Nome deve ter no mínimo 5 caracteres',
                  ),
                ]),
                maxLines: null,
                minLines: 10,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  label: Text('Descrição'),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: widgetButtonAction,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: widgetButtonAction / 2,
                        height: 60,
                        child: Visibility(
                          visible: widget.agronegocioId != null,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.red),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Confirmar'),
                                    content: Text(
                                      'Confirma a exclusão do Agronegócio ${controller.agronegocioModel!.name}',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancelar',
                                          style: context.textStyles.textBold
                                              .copyWith(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          controller.deleteAgronegocio();
                                        },
                                        child: Text(
                                          'Confirmar',
                                          style: context.textStyles.textBold,
                                          
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Deletar',
                              style: context.textStyles.textBold.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: widgetButtonAction / 2,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            final valid =
                                formKey.currentState?.validate() ?? false;
                            if (valid) {
                              if (controller.imagePath == null) {
                                showWarning(
                                  'Imagem obrigatória, por favor clique em adicionar foto',
                                );
                                return;
                              }
                             controller.save(
                                nameEC.text,
                                UtilBrasilFields.converterMoedaParaDouble(
                                    priceEC.text,),
                                descriptionEC.text,
                              );
                            }
                          },
                          child: Text(
                            'Salvar',
                            style: context.textStyles.textBold.copyWith(
                                color: Colors.white,
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
