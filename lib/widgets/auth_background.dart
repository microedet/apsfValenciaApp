// ignore_for_file: non_constant_identifier_names

/*diseño parte superior de la pantalla de inicio sesion*/

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      //stack widget dentro de otros
      child: Stack(
        children: [
          _GreenBox(),
          _IconoPerfil(),
          this.child,
        ],
      ),
    );
  }
}

class _IconoPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class _GreenBox extends StatelessWidget {
  const _GreenBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _GreenBackground(),
      child: Stack(
        children: [
          //posicionar varias burbujas
          Positioned(child: _Burbujas(), top: 90, left: 30),
          Positioned(child: _Burbujas(), top: -40, left: -30),
          Positioned(child: _Burbujas(), top: -50, right: -20),
          Positioned(child: _Burbujas(), bottom: -50, left: 10),
          Positioned(child: _Burbujas(), bottom: 120, right: 20),
        ],
      ),
    );
  }

  BoxDecoration _GreenBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(10, 170, 86, 1),
        Color.fromRGBO(34, 80, 53, 1),
      ]));
}

//burbujas en contenedor verde
class _Burbujas extends StatelessWidget {
  const _Burbujas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
