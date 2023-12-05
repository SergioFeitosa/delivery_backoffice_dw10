import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/ui/helpers/size_extensions.dart';
import 'menu/menu_bar.dart' as menu;

class BaseLayout extends StatefulWidget {
  final Widget body;

  const BaseLayout({super.key, required this.body});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  String _lang = '';

  @override
  void initState() {
    _lang = 'Commodities Internacionais';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final shortestSide = context.screenShortestSide;

    return Scaffold(
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            Container(
              color: Colors.green,
              width: screenWidth * 0.3,
              constraints: BoxConstraints(
                minWidth: screenWidth,
                minHeight: shortestSide * .15,
                maxHeight: shortestSide * .15,
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    width: shortestSide * .13,
                    margin: const EdgeInsets.only(left: 60),
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.of(context).pushNamed('/home');
                      }, // Image tapped
                      child: Image.asset(
                        '/images/agrokelvy2.png',
                        width: 600.0,
                        height: 600.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _lang,
                              style: const TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(255, 255, 150, 7),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Modular.to.navigate('/agronegocios');
                                  });
                                },
                                child: const Text('Agronegócio'),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Modular.to.navigate('/minerals');
                                  });
                                },
                                child: const Text('Minerais'),
                              ),
                            ),

                            const SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Modular.to.navigate('/stones');
                                  });
                                },
                                child: const Text('Pedras'),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Modular.to.navigate('/companys');
                                  });
                                },
                                child: const Text('Empresas'),
                              ),
                            ),

                            const SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Modular.to.navigate('/quemsomos');
                                  });
                                },
                                child: const Text('Quem somos'),
                              ),
                            ),

                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    //width: screenWidth * 0.3,

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _lang = 'Productos Internacionales';
                                    });
                                  },
                                  child: CountryFlag.fromLanguageCode(
                                    'es',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _lang = 'International Commodities';
                                    });
                                  },
                                  child: CountryFlag.fromLanguageCode(
                                    'en',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _lang = 'Commodities Internacionais';
                                    });
                                  },
                                  child: CountryFlag.fromCountryCode(
                                    'br',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _lang = '国际商品';
                                    });
                                  },
                                  child: CountryFlag.fromCountryCode(
                                    'cn',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: IconButton(
                                onPressed: () {
                                  Modular.to.navigate('/login');
                                },
                                icon: const Icon(
                                  Icons.person,
                                  color: Colors.indigo,
                                  size: 24.0,
                                  semanticLabel:
                                      'Text2 to announce in accessibility modes',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.access_alarm,
                                  color: Colors.black,
                                  size: 24.0,
                                  semanticLabel:
                                      'Text2 to announce in accessibility modes',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.accessible,
                                  color: Colors.white,
                                  size: 24.0,
                                  semanticLabel:
                                      'Text2 to announce in accessibility modes',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: shortestSide * .13,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20),
                    right: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    const menu.MenuBar(),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        color: Colors.grey[50],
                        child: widget.body,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
