enum Menu {

  agronegocios(
    '/agronegocios/',
    'agronomy_ico.png',
    'agronomy_ico_selected.png',
    'Administrar Agronegócios',
  ),

  minerals(
    '/minerals/',
    'agronomy_ico.png',
    'agronomy_ico_selected.png',
    'Administrar Minerais',
  ),

  stones(
    '/stones/',
    'agronomy_ico.png',
    'agronomy_ico_selected.png',
    'Administrar Pedras',
  ),

  companys(
    '/companys/',
    'agronomy_ico.png',
    'agronomy_ico_selected.png',
    'Administrar Empresa',
  ),

  paymentType(
    '/payment-type/',
    'payment_type_ico.png',
    'payment_type_ico_selected.png',
    'Administrar Formas de Pagamento',
  ),

  products(
    '/products/',
    'product_ico.png',
    'product_ico_selected.png',
    'Administrar Produtos',
  ),

  orders(
    '/order/',
    'order_ico.png',
    'order_ico_selected.png',
    'Pedidos do dia',
  );

  final String route;
  final String assetIcon;
  final String assetIconSelected;
  final String label;

  const Menu(
    this.route,
    this.assetIcon,
    this.assetIconSelected,
    this.label,
    );

  static Menu? findByPath(String path) {
    final menu = Menu.values.where((element) => path.contains(element.route));

    if(menu.isNotEmpty) {
      return menu.first;
    }
    return null;
  }

}