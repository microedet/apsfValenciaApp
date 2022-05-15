import 'package:apfsvalencia/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../share_preferences/preferences.dart';
import '../widgets/widgest.dart';

class SettingsScreen extends StatefulWidget {
  static String routerName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //variables para guardar las preferencias
  /* bool isModoOscuro = false;
  int genero = 1;
  String name = ' '; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(34, 80, 53, 1),
        centerTitle: true,
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
              const Divider(),
              SwitchListTile.adaptive(
                  value: Preferences.isModoOscuro,
                  title: const Text('Modo Oscuro'),
                  onChanged: (value) {
                    Preferences.isModoOscuro = value;
                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    value
                        ? themeProvider.setDarkmode()
                        : themeProvider.setLightMode();
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<dynamic>(
                  value: 1,
                  groupValue: Preferences.genero,
                  title: const Text('Masculino'),
                  onChanged: (value) {
                    Preferences.genero = value ?? 1;
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<dynamic>(
                  value: 2,
                  groupValue: Preferences.genero,
                  title: const Text('Femenino'),
                  onChanged: (value) {
                    Preferences.genero = value ?? 1;
                    setState(() {});
                  }),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                      labelText: 'Nombre Usuario',
                      helperText: 'introducir nombre del usuario'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
