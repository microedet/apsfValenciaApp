import 'package:flutter/material.dart';

/* fondo verde de la pantalla en la pantalla del perfil personal */

class PersonalProfile extends StatelessWidget {
   final Widget child;
  const PersonalProfile({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //stack widget dentro de otros
      child: Stack(
        children: [
          _GreenBox(),
          this.child,
        ],
      ),
    );
  }
}



class _GreenBox extends StatelessWidget {
  const _GreenBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: _GreenBackground(),
      
    );
  }

  BoxDecoration _GreenBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(10, 170, 86, 1),
        Color.fromRGBO(34, 80, 53, 1),
      ]));
}

