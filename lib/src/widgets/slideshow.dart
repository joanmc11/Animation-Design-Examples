// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;
  const SlideShow({
    Key? key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.red,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 15,
    this.bulletSecundario = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SlideShowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (context) {
            final ssModel =
                Provider.of<_SlideShowModel>(context, listen: false);
            ssModel.colorPrimario = colorPrimario;
            ssModel.colorSecundario = colorSecundario;
            ssModel.bulletPrimario = bulletPrimario;
            ssModel.bulletSecundario = bulletSecundario;
            return _CrearEstructuraSlideshow(
                puntosArriba: puntosArriba, slides: slides);
          },
        )),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    super.key,
    required this.puntosArriba,
    required this.slides,
  });

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba)
          _Dots(
            dotsNum: slides.length,
          ),
        Expanded(
            child: _Slides(
          slides: slides,
        )),
        if (!puntosArriba)
          _Dots(
            dotsNum: slides.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int dotsNum;

  const _Dots({
    required this.dotsNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.red,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (int i = 0; i < dotsNum; i++) _Dot(i)]),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideShowModel>(context);
    final bool selected = (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5);
    final size = selected ? ssModel.bulletPrimario : ssModel.bulletSecundario;
    return AnimatedContainer(
      duration: const Duration(microseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: selected ? ssModel.colorPrimario : ssModel.colorSecundario,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides({required this.slides});

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(context, listen: false).currentPage =
          pageViewController.page ?? 0;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        /*children: const [
          _Slide('assets/svgs/slide-1.svg'),
          _Slide('assets/svgs/slide-1.svg'),
          _Slide('assets/svgs/slide-1.svg'),
        ],*/
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(
    this.slide,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(32),
        child: slide);
  }
}

class _SlideShowModel with ChangeNotifier {
  double _currentpage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 15;
  double _bulletSecundario = 12;

  double get currentPage => _currentpage;

  set currentPage(double currentPage) {
    _currentpage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;
  set colorPrimario(Color color) {
    _colorPrimario = color;
  }

  Color get colorSecundario => _colorSecundario;
  set colorSecundario(Color color) {
    _colorSecundario = color;
  }

  double get bulletPrimario => _bulletPrimario;
  set bulletPrimario(double size) {
    _bulletPrimario = size;
  }

  double get bulletSecundario => _bulletSecundario;
  set bulletSecundario(double size) {
    _bulletSecundario = size;
  }
}
