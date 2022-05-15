import 'package:apfsvalencia/interfaces/input_decorations.dart';
import 'package:apfsvalencia/providers/login_form_provider.dart';
import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class LoginScreen extends StatelessWidget {
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
              const Text(
                'Crea una nueva cuenta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    final logingForm = Provider.of<LoginFormProvider>(context);

    return Container(
        child: Form(
            //TODO:mantener la referencia al Key
            key: logingForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Usuario',
                      labelText: 'Introducir Usuario',
                      prefixIcon: Icons.people_sharp),
                  onChanged: (value) => logingForm.usuario = value,
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
                  onChanged: (value) => logingForm.contrasena = value,
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
                      child: Text(logingForm.isLoading ? 'Espere' : 'Iniciar',
                          style: TextStyle(color: Colors.white)),
                    ),
                    onPressed: logingForm.isLoading
                        ? null
                        : () async {
                            //quitar el teclado
                            FocusScope.of(context).unfocus();
                            if (!logingForm.isValidForm()) return;

                            logingForm.isLoading = true;

                            await Future.delayed(Duration(seconds: 2));

                            //TODO: validar si el login es correcto
                            logingForm.isLoading = false;

                            Navigator.restorablePushReplacementNamed(
                                context, 'home');
                          })
              ],
            )));
  }
}
