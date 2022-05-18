import 'package:apfsvalencia/interfaces/input_decorations.dart';
import 'package:apfsvalencia/providers/providers.dart';
import 'package:apfsvalencia/services/services.dart';
import 'package:apfsvalencia/screens/screens.dart';
import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  static String routerName = 'Register';

  const RegisterScreen({Key? key}) : super(key: key);

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
                    'Crear Cuenta',
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
                    context, LoginScreen.routerName),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.indigo.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: const Text(
                  '¿Ya tienes una cuenta?',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
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
                SizedBox(height: 30),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'email',
                      labelText: 'Introducir email',
                      prefixIcon: Icons.email_sharp),
                  onChanged: (value) => loginForm.email = value,
                  validator: (value) {
                    if (value != null && value.length >= 2) return null;
                    return 'Campo requerido';
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '*****',
                      labelText: 'Contraseña',
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
                            //listen en false pues esta dentro de un metodo
                            final authService = Provider.of<AuthService>(
                                context,
                                listen: false);

                            if (!loginForm.isValidForm()) return;

                            loginForm.isLoading = true;

                            //TODO: validar si el login es correcto
                            final String? errorMessage =
                                await authService.createUser(loginForm.email, loginForm.password);

                            if (errorMessage == null) {
                              Navigator.restorablePushReplacementNamed(
                                  context, HomeScreen.routerName);
                            } else {
                              print(errorMessage);
                              
                            }
                             loginForm.isLoading = false;
 
                          })
              ],
            )));
  }
}
