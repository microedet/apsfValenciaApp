import 'package:flutter/material.dart';

class PersonalProfile extends StatelessWidget {
    

   
  const PersonalProfile({Key? key}) : super(key: key);
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      //stack widget dentro de otros
      child: Stack(
        children: [
          _BackgroundGreen(),
          
        ],
      ),
      
    );
  }
}

class _BackgroundGreen extends StatelessWidget {
  const _BackgroundGreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient:  LinearGradient(colors: [
        Color.fromRGBO(10, 170, 86, 1),
        Color.fromRGBO(34, 80, 53, 1),
      ]
      )
    )
    );
  }
}