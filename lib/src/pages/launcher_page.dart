import 'package:animation_painter/src/routes/routes.dart';
import 'package:animation_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Diseños en Flutter'),
        ),
        drawer: const _MenuPrincipal(),
        body: const _ListaOpciones());
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({super.key});

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(color: appTheme.primaryColorLight),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color:  appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[index].titulo),
        trailing:  Icon(
          Icons.chevron_right,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pageRoutes[index].page,
              ));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final secondaryColor = Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary;
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              // padding: const EdgeInsets.symmetric(horizontal:20),
              width: double.infinity,
              height: 200,
              child: SafeArea(
                child: CircleAvatar(
                    backgroundColor: secondaryColor,
                    child: Text(
                      'JM',
                      style: TextStyle(fontSize: 50),
                    )),
              ),
            ),
            const Expanded(child: _ListaOpciones()),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: secondaryColor,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: secondaryColor,
                value: appTheme.darkTheme,
                onChanged: (value) => appTheme.darkTheme = value,
              ),
            ),
            SafeArea(
              bottom: true,
              left: false,
              top: false,
              right: false,
              child: ListTile(
                leading: Icon(
                  Icons.lightbulb_outline,
                  color: secondaryColor,
                ),
                title: const Text('Custome Theme'),
                trailing: Switch.adaptive(
                  activeColor: secondaryColor,
                  value: appTheme.customTheme,
                  onChanged: (value) => appTheme.customTheme = value,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
