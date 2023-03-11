import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGrueso extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPress;
  final Color color1;
  final Color color2;

  const BotonGrueso(
      {super.key,
      required this.title,
      this.icon = FontAwesomeIcons.circle,
      required this.onPress,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _BotonGruesoBackground(
            color1: color1,
            color2: color2,
            icon: icon,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              Expanded(
                  child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )),
              const FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              const SizedBox(
                width: 40,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGruesoBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;
  const _BotonGruesoBackground({
    required this.color1,
    required this.color2,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(4, 6),
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            color1,
            color2,
          ])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
    );
  }
}
