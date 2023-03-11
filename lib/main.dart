import 'package:animation_painter/retos/cuadrado_animado_page.dart';
import 'package:animation_painter/src/pages/animaciones_page.dart';
import 'package:animation_painter/src/pages/emergency_page.dart';
import 'package:animation_painter/src/pages/graficas_circulares_page.dart';
import 'package:animation_painter/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

import 'src/labs/circular_progress_page.dart';
import 'src/labs/slideshow_page.dart';
import 'src/pages/slide_show_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: EmergencyPage()
      
      //SlideshowPage()
      
      //GraficaCircularPage(),
      
      //CuadradoAnimadoPage(),
    );
  }
}