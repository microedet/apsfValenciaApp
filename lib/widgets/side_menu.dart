import 'package:apfsvalencia/screens/screens.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.home_max_sharp),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routerName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.login_outlined),
            title: const Text('Login'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, LoginScreen.routerName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt_rounded),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, ProfileScreen.routerName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_accessibility_rounded),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsScreen.routerName);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
