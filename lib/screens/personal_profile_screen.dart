import 'package:apfsvalencia/screens/home_screen.dart';
import 'package:apfsvalencia/services/services.dart';
import 'package:apfsvalencia/widgets/personal_profile.dart';
import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../interfaces/input_decorations.dart';
import '../providers/providers.dart';
import '../services/auth_service.dart';
import 'screens.dart';

class PersonalProfileScreen extends StatelessWidget {
  static String routerName = 'PersonalProfile';

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
        title: const Text('Datos Personales'),
      ),
      body: PersonalProfile(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //bloque para dejar espacio arriba de la pantalla
              const SizedBox(height: 25),
              CardContainer(
                  //columna para poner widget unos debajos de otros
                  child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Datos Personales',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    //contenido datos a rellenar
                    child: _DatosForm(),
                  )
                ],
              )),
              const SizedBox(
                height: 50,
              ),

              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DatosForm extends StatelessWidget {
  const _DatosForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
        child: Form(
            //TODO:mantener la referencia al Key
            key: loginForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Usuario',
                      labelText: 'Usuario',
                      prefixIcon: Icons.supervised_user_circle_sharp),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 2) return null;
                    return 'El nombre tiene que tener más de dos caracteres';
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'nombre',
                      labelText: 'nombre',
                      prefixIcon: Icons.all_inbox_outlined),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 2) return null;
                    return 'El nombre tiene que tener más de dos caracteres';
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Apellidos',
                      labelText: 'Apellidos',
                      prefixIcon: Icons.all_inbox),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 2) return null;
                    return 'El nombre tiene que tener más de dos caracteres';
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '00000000D',
                      labelText: 'DNI',
                      prefixIcon: Icons.numbers_outlined),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 9) return null;
                    return 'El DNI tiene que tener más de 8 caracteres';
                  },
                ),
                SizedBox(height: 40),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Dirección',
                      labelText: 'Dirección',
                      prefixIcon: Icons.gps_fixed_outlined),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 2) return null;
                    return 'La Dirección tiene que tener más de dos caracteres';
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '46000',
                      labelText: 'Código Postal',
                      prefixIcon: Icons.gps_fixed_outlined),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 2) return null;
                    return 'El código postal tiene que tener más de dos caracteres';
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Localidad',
                      labelText: 'Localidad',
                      prefixIcon: Icons.location_city_outlined),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 2) return null;
                    return 'La localidad tiene que tener más de dos caracteres';
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Provincia',
                      labelText: 'Provincia',
                      prefixIcon: Icons.location_city_outlined),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 2) return null;
                    return 'La Provincia tiene que tener más de dos caracteres';
                  },
                ),
                SizedBox(height: 40),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '+340000000000',
                      labelText: 'Teléfono Móvil',
                      prefixIcon: Icons.all_inbox),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 8) return null;
                    return 'El telefono tiene que tener más de 8 caracteres';
                  },
                ),
                SizedBox(height: 30),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Colors.green,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(loginForm.isLoading ? 'Espere' : 'Iniciar',
                          style: TextStyle(color: Colors.white)),
                    ),
                    onPressed: loginForm.isLoading
                        ? null
                        : () async {
                            //quitar el teclado
                            FocusScope.of(context).unfocus();

                            final authService = Provider.of<AuthService>(
                                context,
                                listen: false);

                            if (!loginForm.isValidForm()) return;

                            loginForm.isLoading = true;

                            //await Future.delayed(Duration(seconds: 2));

                            //TODO: validar si el login es correcto
                            final String? errorMessage = await authService
                                .login(loginForm.email, loginForm.password);

                            if (errorMessage == null) {
                              Navigator.restorablePushReplacementNamed(
                                  context, HomeScreen.routerName);
                            } else {
                              NotificationsService.showSnackbar(errorMessage);
                              loginForm.isLoading = false;
                            }
                          })
              ],
            )));
  }
}
