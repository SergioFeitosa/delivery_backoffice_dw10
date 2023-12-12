import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/extensions/formatter_extensions.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import 'agronegocio_presentation_controller.dart';

class AgronegocioPresentationPage extends StatefulWidget {
  final int? agronegocioId;
  const AgronegocioPresentationPage({super.key, this.agronegocioId});
  @override
  State<AgronegocioPresentationPage> createState() =>
      _AgronegocioPresentationPageState();
}

class Sachen {
  String title;
  String image;
  String description;
  Sachen(
    this.title,
    this.image,
    this.description,
  );
}

final List<Sachen> imgList = [
  Sachen(
    'Café',
    '/images/cafe.jpg',
    'Cafezinho preto',
  ),
  Sachen(
    'Etanol',
    '/images/etanol.jpg',
    'Etanol corote',
  ),
  Sachen(
    'Milho',
    '/images/milho.jpg',
    'Milho para pamonha',
  ),
  Sachen(
    'Soja',
    '/images/soja.jpg',
    'Soja para óleo',
  ),
  Sachen(
    'Sorgo',
    '/images/sorgo.jpg',
    'Sorgo nome estranho',
  ),
  Sachen(
    'Trigo',
    '/images/trigo.jpg',
    'Trigo para pães',
  ),
];
/*
final List<String> imgList = [
  'https:
  'https:
  'https:
  'https:
  'https:
  'https:
];
*/
final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: const EdgeInsets.all(5.0),
        color: Colors.white24,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(item.image, fit: BoxFit.fill, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Text(
                    'No. ${imgList.indexOf(item) + 1} - ${item.description}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    .toList();

class _AgronegocioPresentationPageState
    extends State<AgronegocioPresentationPage> with Loader, Messages {
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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('Complicated image slider demo')),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
                Container(
                  width: width,
                  height: height,
                  color: Colors.amber,
                  child: const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'FAZENDAS DE AGRO PREPARADAS PARA A DEMANDA',
                              style: TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('''RESUMO
                                      Objetivo: desenvolver um website sobre o “Teste da Linguinha”.
                                      Métodos: pesquisa aplicada, baseada no desenvolvimento ativo de um website com a finalidade de
                                      disponibilizar informações sobre o Teste da Linguinha. O desenvolvimento desse estudo consistiu de
                                      3 etapas: conceituação, desenvolvimento e implementação. Para a etapa de conceituação foi definido o
                                      público-alvo, o objetivo, a análise e a definição do conteúdo por meio de revisão de literatura sobre 
                                      anquiloglossia, avaliação do frênulo lingual em bebês e frenotomia. A etapa de desenvolvimento do website foi
                                      realizada por meio de editor de texto, digitalizador e editor de imagens. Para a construção das páginas
                                      Web foi utilizado o editor de texto Sublime. Para o teste das páginas em ambiente Internet foi selecionado
                                      o navegador Chrome. A fase de implementação envolveu a publicação do website na rede mundial de
                                      computadores.
                                      Resultados: o website “Teste da Linguinha” encontra-se implementado com domínio já registrado. O
                                      conteúdo desse website é destinado a pais/cuidadores e profissionais da saúde, orientando sobre o teste
                                      e sobre a língua presa, com base em estudos científicos. O referido website foi elaborado com layout
                                      responsivo, podendo ser acessado em tablet, telefones celulares com acesso à internet e/ou em computadores, 
                                      independentemente do sistema operacional, por meio dos principais navegadores disponíveis,
                                      sem perder a funcionalidade.
                                      Conclusão: o website “Teste da linguinha” foi finalizado e pode ser acessado pelo endereço eletrônico
                                      www.testedalinguinha.com.
                                      Descritores: Freio Lingual; Fonoaudiologia; Língua; Informática em Saúde)'''),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width,
                  height: height,
                  color: Colors.green.shade200,
                  child: const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'FAZENDAS DE AGRO PREPARADAS PARA A DEMANDA',
                              style: TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('''RESUMO
                                      Objetivo: desenvolver um website sobre o “Teste da Linguinha”.
                                      Métodos: pesquisa aplicada, baseada no desenvolvimento ativo de um website com a finalidade de
                                      disponibilizar informações sobre o Teste da Linguinha. O desenvolvimento desse estudo consistiu de
                                      3 etapas: conceituação, desenvolvimento e implementação. Para a etapa de conceituação foi definido o
                                      público-alvo, o objetivo, a análise e a definição do conteúdo por meio de revisão de literatura sobre 
                                      anquiloglossia, avaliação do frênulo lingual em bebês e frenotomia. A etapa de desenvolvimento do website foi
                                      realizada por meio de editor de texto, digitalizador e editor de imagens. Para a construção das páginas
                                      Web foi utilizado o editor de texto Sublime. Para o teste das páginas em ambiente Internet foi selecionado
                                      o navegador Chrome. A fase de implementação envolveu a publicação do website na rede mundial de
                                      computadores.
                                      Resultados: o website “Teste da Linguinha” encontra-se implementado com domínio já registrado. O
                                      conteúdo desse website é destinado a pais/cuidadores e profissionais da saúde, orientando sobre o teste
                                      e sobre a língua presa, com base em estudos científicos. O referido website foi elaborado com layout
                                      responsivo, podendo ser acessado em tablet, telefones celulares com acesso à internet e/ou em computadores, 
                                      independentemente do sistema operacional, por meio dos principais navegadores disponíveis,
                                      sem perder a funcionalidade.
                                      Conclusão: o website “Teste da linguinha” foi finalizado e pode ser acessado pelo endereço eletrônico
                                      www.testedalinguinha.com.
                                      Descritores: Freio Lingual; Fonoaudiologia; Língua; Informática em Saúde)'''),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

          // return SingleChildScrollView(
          //   padding: const EdgeInsets.all(10),
          //   child: Column(
          //     children: [ Row ( 
          //       children: [
          //         CarouselSlider(
          //         options: CarouselOptions(
          //           autoPlay: true,
          //           aspectRatio: 2.0,
          //           enlargeCenterPage: true,
          //         ),
          //         items: imageSliders,
          //       ),
          //     ],
          //     ),
          //     const Row (
          //       children: [Text('data')],
          //     ),],
              
          //   ),
          // );
