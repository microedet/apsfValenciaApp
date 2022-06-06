import 'package:apfsvalencia/providers/providers.dart';
import 'package:flutter/material.dart';


class CardBlogList extends StatelessWidget {
  late ApiBlog apiBlog;

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
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
                      'https://static2.lasprovincias.es/www/multimedia/201801/08/media/cortadas/ciudad-artes-kXbB-U50574220968wkD-624x385@Las%20Provincias.jpg'
                        /* 'https://apsvalencia.pythonanywhere.com' +
                            apiBlog.image */),
                    //colorFilter: ColorFilters.greyscale,
                    child: InkWell(
                      onTap: () {
                        //para cargar pantalla detail
                       
                      },
                    ),
                    height: 240,
                    fit: BoxFit.fill),
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
            //SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text('TITULO',
                //apiBlog.title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            //SizedBox(height: 8),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [TextButton(onPressed: () {

              }, child: Text('Leer Mas'))],
            )
          ],
        ),
        // ignore: prefer_const_constructors
      );
  }
}