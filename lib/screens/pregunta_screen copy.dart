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
           SizedBox(height: 151),
 
           SlimyCard(
            width: MediaQuery.of(context).size.width / 1.2,
            topCardHeight: 100,
            color: Color.fromRGBO(34, 80, 53, 1),
            topCardWidget:  SlimyCardTopWidget(apiPregunta),
            bottomCardWidget: const SlimyCardBottomWidget(),
          ),
        ],
      );
}

class SlimyCardTopWidget extends StatelessWidget {
   SlimyCardTopWidget(ApiPregunta apiPregunta, {Key? key}) : super(key: key);
   

  @override
  Widget build(BuildContext context ) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /* Image.network(
          'https://upload.wikimedia.org/wikipedia/en/d/d4/Mickey_Mouse.png',
          height: 150,
          width: 150,
        ), */
        Text( "texto",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                       fontSize: 24,
                     ),
        )
        
      ],
    );
  }
}

class SlimyCardBottomWidget extends StatelessWidget {
  const SlimyCardBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text("It is none other than"),
        Text(
          "Micky Mouse",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ],
    );
  }
}


       
        /* padding: const EdgeInsets.all(10.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [ */
                 /*  Ink.image(
                      // ignore: prefer_const_constructors
                      image: NetworkImage(
                          'https://apsvalencia.pythonanywhere.com' +
                             apiBlog.image),
                      colorFilter: ColorFilters.greyscale,
                      child: InkWell(
                        onTap: () {},
                      ),
                      height: 240,
                      fit: BoxFit.cover), */
                  /* Text(
                     apiBlog.title,
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                       fontSize: 24,
                     ), 
                    ), */
               /*  ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.all(16).copyWith(bottom: 0),
                child: Text(
                  apiPregunta.tituloPregunta,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 8),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                       // print(apiBlog.title);
                        /* Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder:(BuildContext context) {
                              return new DetailBlogScreen(apiBlog.title,apiBlog.image,apiBlog.content);
                          }) );*/
                        /* Navigator.popAndPushNamed(
                            context, DetailBlogScreen.routerName, arguments:
                          DetailBlogScreen(apiBlog.title )
                        ); */
                      },
                      child: Text('Leer Mas'))
                ],
              )
            ],
          ),
        ), */
      

