import 'package:apfsvalencia/interfaces/input_decorations.dart';
import 'package:apfsvalencia/providers/login_form_provider.dart';
import 'package:apfsvalencia/screens/screens.dart';
import 'package:apfsvalencia/services/auth_service.dart';
import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../services/services.dart';

class LoginScreen extends StatelessWidget {
  static String routerName = 'Login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(34, 80, 53, 1),
        title: const Text('APFS VALENCIA'),
      ),
      drawer: const SideMenu(),
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //bloque para dejar espacio arriba de la pantalla
              const SizedBox(height: 250),
              CardContainer(
                  //columna para poner widget unos debajos de otros
                  child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Iniciar Sesión',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _IniciarSesionForm(),
                  )
                ],
              )),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, RegisterScreen.routerName),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.indigo.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: const Text(
                  'Crea una nueva cuenta',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
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

class _IniciarSesionForm extends StatelessWidget {
  const _IniciarSesionForm({Key? key}) : super(key: key);

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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'email',
                      labelText: 'Introducir email',
                      prefixIcon: Icons.alternate_email_sharp),
                  onChanged: (value) => loginForm.email = value,
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El correo no es correcto';
                    //if (value != null && value.length >= 2) return null;
                    //return 'Campo requerido';
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '*****',
                      labelText: 'Password',
                      prefixIcon: Icons.lock_outline),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 8) return null;
                    return 'La contraseña debe de ser 8 caracteres';
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
