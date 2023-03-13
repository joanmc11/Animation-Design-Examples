import 'package:animation_painter/src/models/layout_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animation_painter/src/pages/launcher_page.dart';
import 'package:animation_painter/src/pages/launcher_tablet_page.dart';
import 'package:animation_painter/src/theme/theme.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeChanger(2)),
    ChangeNotifierProvider(create: (_) => LayoutModel()),

  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
        theme: currentTheme,
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: OrientationBuilder(
          builder: (context, orientation) {
            // print(orientation);
            final screenSize = MediaQuery.of(context).size;

            if (screenSize.width > 500) {
              return const LauncherTabletPage();
            } else {
              return const LauncherPage();
            }
          },
        ));
  }
}
