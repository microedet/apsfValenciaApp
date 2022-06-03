import 'package:apfsvalencia/models/models.dart';
import 'package:apfsvalencia/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


class ApiBlogProvider extends ChangeNotifier {
  late List<ApiBlog> apiblog;

   

  //ApiPruebaProvider(this.apiprueba)

  Future<List<ApiBlog>> getAllApiBlog() async {
    //si ya tiene datos devuelve los datos no los actualiza
    //if (apiprueba != null) {
    //  return apiprueba;
    //}

    //si no hay datos llamados al servicio
    var service = new ApiBlogServices();
    this.apiblog = await service.getAll();

    //se notifican los cambios
    notifyListeners();
    return apiblog;
  }

  Future<List<ApiBlog>> refreshApiPrueba() async {
    //si no hay datos llamados al servicio
    var service = new ApiBlogServices();
    this.apiblog = await service.getAll();

    //se notifican los cambios
    notifyListeners();
    return apiblog;


  }
}