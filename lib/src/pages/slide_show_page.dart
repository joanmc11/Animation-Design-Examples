import 'package:animation_painter/src/theme/theme.dart';
import 'package:animation_painter/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(
            child: MiSlideShow(),
          ),
          Expanded(child: MiSlideShow()),
        ],
      ),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return SlideShow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      colorPrimario: appTheme.darkTheme
          ? appTheme.currentTheme.colorScheme.secondary
          : Colors.redAccent,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg',),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
