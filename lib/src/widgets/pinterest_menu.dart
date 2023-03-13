// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData icon;
  PinterestButton({
    required this.onPressed,
    required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;
  const PinterestMenu({
    Key? key,
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey, 
    required this.items,
  }) : super(key: key);

  /* final List<PinterestButton> items = [
    PinterestButton(onPressed: () {}, icon: Icons.pie_chart),
    PinterestButton(onPressed: () {}, icon: Icons.search),
    PinterestButton(onPressed: () {}, icon: Icons.notifications),
    PinterestButton(onPressed: () {}, icon: Icons.supervised_user_circle),
  ]; */

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: mostrar ? 1 : 0,
            child: Builder(

             builder: (context) {
              Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
              Provider.of<_MenuModel>(context).activeColor = activeColor;
              Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;
               return  _PinterestMenuBackground(
               
                child: _MenuItems(
                  menuItems: items,
                  
                ),
              );
             },
            )));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
 
  const _PinterestMenuBackground({
    super.key,
    required this.child,
    
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: const [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  
  const _MenuItems(
      {super.key,
      required this.menuItems,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) => _PinterestMenuButton(
                index: index,
                item: menuItems[index],
               
              )),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  
  final PinterestButton item;
  const _PinterestMenuButton(
      {required this.index,
      required this.item,
     });

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.grey;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
  Color get backgroundColor => _backgroundColor;
  set backgroundColor (Color color){
    _backgroundColor = color;
  }
  Color get activeColor => _activeColor;
  set activeColor (Color color){
    _activeColor = color;
  }
  Color get inactiveColor => _inactiveColor;
  set inactiveColor (Color color){
    _inactiveColor = color;
  }
  

}
