import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CuadradoAnimado()),
    );
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
  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;
  int duration = 4000;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));
    moveRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.bounceOut)));
    moveUp = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut)));
    moveLeft = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)));
    moveDown = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() {
      /*double currentInterval =
          (controller.lastElapsedDuration?.inMilliseconds ?? 0) / duration;
       
      if (currentInterval.toStringAsFixed(1) == '0.5') {
       moveRight = moveLeft;
        moveUp = moveDown;
      }*/
      if (controller.status == AnimationStatus.completed) {
        //controller.reverse();
        controller.reset();
        controller.forward();
      }
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
    //controller.forward();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: controller,
            child: _Rectangulo(),
            builder: (context, child) {
              return Transform.translate(
                  offset: Offset(moveRight.value - moveLeft.value, moveUp.value - moveDown.value), child: child);
            }),
        ElevatedButton(onPressed: (){
          controller.forward();
        }, child: const Text('Animate')),
        ElevatedButton(onPressed: (){
          controller.stop();
        }, child: const Text('Stop')),
        ElevatedButton(onPressed: (){
          controller.reset();
        }, child: const Text('Reset')),
        ElevatedButton(onPressed: (){
          controller.reverse();
        }, child: const Text('Reverse')),

      ],
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
