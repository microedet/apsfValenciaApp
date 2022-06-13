///pantalla para mostrar los articulos del blog **/

import 'package:apfsvalencia/providers/providers.dart';
import 'package:apfsvalencia/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slimy_card/slimy_card.dart';

import '../interfaces/color_filters.dart';

class PreguntaScreen extends StatefulWidget {
  static String routerName = 'Pregunta';

  const PreguntaScreen({Key? key}) : super(key: key);

  @override
  State<PreguntaScreen> createState() => _PreguntaScreenState();
}

class _PreguntaScreenState extends State<PreguntaScreen> {
  String? imagen;

  @override
  Widget build(BuildContext context) {
    final apiPreguntaProvider = Provider.of<ApiPreguntaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.popAndPushNamed(context, HomeScreen.routerName);
          },
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(34, 80, 53, 1),
        title: const Text('APFS VALENCIA'),
      ),
      body: Column(
        //child: Column(

        children: [
          Flexible(
            child: FutureBuilder(
              future: apiPreguntaProvider.getAllApiPregunta(),
              builder: (_, AsyncSnapshot<List<ApiPregunta>> snapshot) {
                if (snapshot.hasData) {
                  final apiPregunta = snapshot.data;
                  //print(apiblog!.length);
                  //return CardBlog();

                  return ListView.builder(
                    itemCount: apiPregunta!.length,
                    itemBuilder: (_, int i) {
                      return _cardBlog(context, apiPregunta[i]);
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],

        //),
      ),
    );
  }

  Widget _cardBlog(context, ApiPregunta apiPregunta) => Column(
        children: [
          SizedBox(height: 30),
          SlimyCard(
            width: MediaQuery.of(context).size.width / 1.2,
            topCardHeight: 150,
            bottomCardHeight: 300,
            color: Color.fromRGBO(34, 80, 53, 1),
            topCardWidget: SlimyCardTopWidget(apiPregunta),
            bottomCardWidget:  SlimyCardBottomWidget(apiPregunta),
          ),
        ],
      );
}

class SlimyCardTopWidget extends StatelessWidget {
  ApiPregunta apiPregunta;
  SlimyCardTopWidget(this.apiPregunta, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          apiPregunta.tituloPregunta,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}

class SlimyCardBottomWidget extends StatelessWidget {
  
  ApiPregunta apiPregunta;
  
  SlimyCardBottomWidget(this.apiPregunta, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              Text(
                apiPregunta.respuestaPregunta,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

