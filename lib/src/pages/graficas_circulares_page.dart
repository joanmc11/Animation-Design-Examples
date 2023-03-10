import 'package:animation_painter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficaCircularPage extends StatefulWidget {
  const GraficaCircularPage({super.key});

  @override
  State<GraficaCircularPage> createState() => _GraficaCircularPageState();
}

class _GraficaCircularPageState extends State<GraficaCircularPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) {
                porcentaje = 0;
              }
            });
          },
          child: const Icon(
            Icons.refresh,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.red),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.amber),
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.deepPurple,),
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    required this.color,
  });

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: Colors.grey,
        grosorPrimario: 10,
        grosorSecundario: 6,
      ),
    );
  }
}
