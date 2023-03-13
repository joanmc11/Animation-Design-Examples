import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animation_painter/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
          body: Stack(
        children: const [
           PinterestGrid(), 
          _PinterestdMenuLocation()],
      )),
    );
  }
}

class _PinterestdMenuLocation extends StatelessWidget {
  const _PinterestdMenuLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(
      context,
    ).mostrar;
    return Positioned(
        bottom: 30,
        child: SizedBox(
            width: widthPantalla,
            height: 100,
            child: Align(
                alignment: Alignment.center,
                child: PinterestMenu(
                  mostrar: mostrar,
                  activeColor: Colors.redAccent,
                  inactiveColor: Colors.blueGrey,
                  items: [
                    PinterestButton(onPressed: () {}, icon: Icons.pie_chart),
                    PinterestButton(onPressed: () {}, icon: Icons.search),
                    PinterestButton(
                        onPressed: () {}, icon: Icons.notifications),
                    PinterestButton(
                        onPressed: () {}, icon: Icons.supervised_user_circle),
                  ],
                ))));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        //print('Ocultar menú');
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        //print('Mostrar menu');
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(3, 2),
          const QuiltedGridTile(2, 2),
          //const QuiltedGridTile(1, 1),
          //const QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _PinterestItem(index: index),
          childCount: items.length),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel extends ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar(bool mostrar) {
    _mostrar = mostrar;
    notifyListeners();
  }
}
