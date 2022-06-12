import 'package:apfsvalencia/models/models.dart';
import 'package:apfsvalencia/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


class ApiPreguntaProvider extends ChangeNotifier {
  late List<ApiPregunta> apiPregunta;

   

  //ApiPruebaProvider(this.apiprueba)

  Future<List<ApiPregunta>> getAllApiPregunta() async {
    //si ya tiene datos devuelve los datos no los actualiza
    /* if (apiblog != null) {
      return apiblog;
    } */

    //si no hay datos llamados al servicio
    var service = new ApiPreguntaServices();
    this.apiPregunta = await service.getAll();

    //se notifican los cambios
    notifyListeners();
    return apiPregunta;
  }

  Future<List<ApiPregunta>> refreshApiPrueba() async {
    //si no hay datos llamados al servicio
    var service = new ApiPreguntaServices();
    this.apiPregunta = await service.getAll();

    //se notifican los cambios
    notifyListeners();
    return apiPregunta;


  }
}