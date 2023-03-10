import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CuadradoAnimado()));
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moveRight;
  late Animation<double> enlarge;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    rotation = Tween(begin: 0.0, end: 2 * math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)));
    opacityOut = Tween(begin: 1.0, end: 0.1).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1, curve: Curves.easeOut)));
    moveRight = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    enlarge = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.addListener(() {
      //print('Status:${controller.status}');
      if (opacity.value == 1.0) {
        opacity = opacityOut;
      }
      if (controller.status == AnimationStatus.completed) {
        //controller.reverse();
        controller.reset();
      }
    });
    //controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: controller,
          child: _Rectangulo(),
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(moveRight.value, moveRight.value),
              child: Transform.rotate(
                  angle: rotation.value,
                  child: Opacity(
                      opacity: opacity.value,
                      child:
                          Transform.scale(scale: enlarge.value, child: child))),
            );
          },
        ),
        ElevatedButton(
            onPressed: () {
              controller.forward();
            },
            child: const Text('Rotar'))
      ],
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
      child: const Center(child: Text('Hola')),
    );
  }
}
