import 'package:animation_painter/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class HeadersPage extends StatefulWidget {
  const HeadersPage({super.key});

  @override
  State<HeadersPage> createState() => _HeadersPageState();
}

class _HeadersPageState extends State<HeadersPage> {
  bool gradient = false;
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: gradient
          ? const HeaderWavesGradient()
          : HeaderWaves(color: appTheme.currentTheme.colorScheme.secondary),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            gradient = !gradient;
          });
        },
        elevation: 1,
        child: Text(
          gradient ? 'Normal' : 'Gradient',
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
