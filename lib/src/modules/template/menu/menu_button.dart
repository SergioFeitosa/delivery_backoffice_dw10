import 'package:flutter/material.dart';

import '../../../core/ui/styles/text_styles.dart';
import 'menu_enum.dart';

class MenuButton extends StatelessWidget {
  final Menu menu;
  final Menu? menuSelected;
  final ValueChanged<Menu> onPressed;

  const MenuButton({
    super.key,
    required this.menu,
    this.menuSelected,
    required this.onPressed,
  });


  // @override
  // Widget build(BuildContext context) {
    
  //   return ExpansionTile(
  //     title: Text(menu.label),
  //     children: const <Widget>[
  //       ListTile(title: Text('amendoim')),
  //       ListTile(title: Text('algodão')),
  //       ListTile(title: Text('soja')),
  //       ListTile(title: Text('sorgo')),
  //     ],
  //   );
  // }

   @override
   Widget build(BuildContext context) {
     final isSelected = menuSelected == menu;
     return LayoutBuilder(
       builder: (_, constrains) {
         return Visibility(
           visible: constrains.maxWidth != 90,
           replacement: Container(
             margin: const EdgeInsets.all(10),
             padding: const EdgeInsets.all(5),
             decoration: isSelected
                 ? BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: const Color(0XFFFFF5E2),
                   )
                 : null,
             child: Tooltip(
               message: menu.label,
               child: IconButton(
                 onPressed: () => onPressed(menu),
                 icon: Image.asset(
                   'assets/images/icons/${isSelected ? menu.assetIconSelected : menu.assetIcon}',
                 ),
               ),
             ),
           ),
           child: Material(
             color: Colors.transparent,
             child: InkWell(
               onTap: () => onPressed(menu),
               borderRadius: BorderRadius.circular(20),
               child: Container(
                 margin: const EdgeInsets.all(10),
                 padding: const EdgeInsets.all(5),
                 decoration: isSelected
                     ? BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: const Color(0XFFFFF5E2),
                       )
                     : null,
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Image.asset(
                         'assets/images/icons/${isSelected ? menu.assetIconSelected : menu.assetIcon}',
                       ),
                     ),
                     const SizedBox(
                       width: 10,
                     ),
                     Expanded(
                       child:  ExpansionTile(
                      title: Text(menu.label),
                      
                      children: const <Widget>[
                        ListTile(title: Text('amendoim')),
                        ListTile(title: Text('algodão')),
                        ListTile(title: Text('soja')),
                        ListTile(title: Text('sorgo')),
                      ],
                    ),

                     ),
                     const SizedBox(
                       width: 10,
                     ),
                   ],
                 ),
               ),
             ),
           ),
         );
       },
     );
   }
}


