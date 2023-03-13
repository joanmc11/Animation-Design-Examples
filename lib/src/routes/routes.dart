// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:animation_painter/retos/cuadrado_animado_page.dart';
import 'package:animation_painter/src/labs/slideshow_page.dart';
import 'package:animation_painter/src/pages/emergency_page.dart';
import 'package:animation_painter/src/pages/graficas_circulares_page.dart';
import 'package:animation_painter/src/pages/headers_page.dart';
import 'package:animation_painter/src/pages/pinterest_page.dart';
import 'package:animation_painter/src/pages/slide_show_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/sliver_list_page.dart';


final pageRoutes = <_Route>[
_Route(icon: FontAwesomeIcons.slideshare, titulo: 'Slideshow', page: const SlideshowPage()),
_Route(icon: FontAwesomeIcons.truckMedical, titulo: 'Emergencia', page: const EmergencyPage()),
_Route(icon: FontAwesomeIcons.heading, titulo: 'Encabezados', page: const HeadersPage()),
_Route(icon: FontAwesomeIcons.peopleCarryBox, titulo: 'Cuadro Animado', page: const CuadradoAnimado()),
_Route(icon: FontAwesomeIcons.circleNotch, titulo: 'Barra progreso', page: const GraficaCircularPage()),
_Route(icon: FontAwesomeIcons.pinterest, titulo: 'Pinterest', page: const PinterestPage()),
_Route(icon: FontAwesomeIcons.mobile, titulo: 'Slivers', page: const SliverPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;
  _Route({
    required this.icon,
    required this.titulo,
    required this.page,
  });
  

}
