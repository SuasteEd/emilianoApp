import 'package:emiliano_ex2p/data/users.dart';
import 'package:emiliano_ex2p/views/registro_view.dart';
import 'package:flutter/material.dart';

import 'lista_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

final GlobalKey<ScaffoldMessengerState> key =
    GlobalKey<ScaffoldMessengerState>();
TextEditingController userController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScaffoldMessenger(
        key: key,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 200,
                  child: Container(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Text(
                  'Iniciar sesión',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Text(
                  'Ingresa tus datos',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepPurple, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: userController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Usuario'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepPurple, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Contraseña'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () {
                    if (validaciones()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListaView()),
                          (route) => false);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿No tienes una cuenta?  ',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistroView()))),
                    child: const Text('Registrate',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  bool validaciones() {
    var login = user
        .where((element) => element.usuario == userController.text)
        .toList();

    if (userController.text.isEmpty || passwordController.text.isEmpty) {
      showAlert('Complete todos los campos');
      return false;
    }

    if (login.isNotEmpty) {
      var access = login[0];
      if (access.password == passwordController.text) {
        return true;
      }
    }
    showAlert('Usuario o constraseña incorrectos');
    return false;
  }

  void showAlert(String contenido) {
    final snackbar = SnackBar(
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 1),
        content: Text(
          contenido,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
          ),
        ));
    key.currentState!.showSnackBar(snackbar);
  }
}
