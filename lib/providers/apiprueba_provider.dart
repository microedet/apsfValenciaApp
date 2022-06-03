import 'package:apfsvalencia/models/models.dart';
import 'package:apfsvalencia/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ApiPruebaProvider extends ChangeNotifier {
  late List<ApiPrueba> apiprueba;

   

  //ApiPruebaProvider(this.apiprueba)

  Future<List<ApiPrueba>> getAllApiPrueba() async {
    //si ya tiene datos devuelve los datos no los actualiza
    //if (apiprueba != null) {
    //  return apiprueba;
    //}

    //si no hay datos llamados al servicio
    var service = new ApiPruebaServices();
    this.apiprueba = await service.getAll();

    //se notifican los cambios
    notifyListeners();
    return apiprueba;
  }

  Future<List<ApiPrueba>> refreshApiPrueba() async {
    //si no hay datos llamados al servicio
    var service = new ApiPruebaServices();
    this.apiprueba = await service.getAll();

    //se notifican los cambios
    notifyListeners();
    return apiprueba;


  }
}
