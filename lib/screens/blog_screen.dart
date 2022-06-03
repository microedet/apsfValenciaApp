/**pantalla para mostrar los articulos del blog **/

import 'package:apfsvalencia/providers/providers.dart';
import 'package:apfsvalencia/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../interfaces/color_filters.dart';
import '../models/models.dart';

class BlogScreen extends StatefulWidget {
  static String routerName = 'Blog';

  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: _datos());
  }

  Widget _datos() {
    return Column(
      children: [Flexible(child: _listaApiBlog())],
    );
  }

  Widget _listaApiBlog() {
    final apiBlogProvider = Provider.of<ApiBlogProvider>(context);
    return FutureBuilder(
      future: apiBlogProvider.getAllApiBlog(),
      builder: (_, AsyncSnapshot<List<ApiBlog>> snapshot) {
        if (snapshot.hasData) {
          final apiblog = snapshot.data;
          print(apiblog!.length);

          return ListView.builder(
            itemCount: apiblog!.length,
            itemBuilder: (_, int i) {
              //return _card(apiblog![i]);
              return _cardBlog(apiblog![i]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _card(ApiBlog apiBlog) {
    return ListTile(
      title: Text(apiBlog.title),
      subtitle: Text(apiBlog.content),
    );
  }
}

Widget _cardBlog(ApiBlog apiBlog) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                  // ignore: prefer_const_constructors
                  image: NetworkImage(
                      'https://apsvalencia.pythonanywhere.com' + apiBlog.image),
                  colorFilter: ColorFilters.greyscale,
                  child: InkWell(
                    onTap: () {},
                  ),
                  height: 240,
                  fit: BoxFit.cover),
              /* Text(
                   apiBlog.title,
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                     fontSize: 24,
                   ), 
                  ), */
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              apiBlog.title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 8),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [TextButton(onPressed: () {}, child: Text('Leer Mas'))],
          )
        ],
      ),
      // ignore: prefer_const_constructors
    );
