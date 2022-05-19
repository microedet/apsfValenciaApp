/* diseño del fondo de la pantalla principal */

import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundAllScreen extends StatelessWidget {
  const BackgroundAllScreen({Key? key}) : super(key: key);
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
        
      ],
    );
  }
}


