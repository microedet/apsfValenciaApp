/* diseño del fondo de la pantalla principal */

import 'dart:math';

import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({Key? key}) : super(key: key);
  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
        0.2,
        0.8
      ],
          colors: [
        Color.fromRGBO(10, 170, 86, 1),
        Color.fromRGBO(34, 80, 53, 1)
      ]));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //color verde del fondo
        Container(
          decoration: boxDecoration,
        ),

        //white box
        Positioned(top: -130, left: -30, child: _WhiteBox()),
      ],
    );
  }
}

class _WhiteBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
          width: 360,
          height: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(242, 253, 255, 1),
            ]),
          )),
    );
  }
}
