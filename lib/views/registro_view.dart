import 'package:emiliano_ex2p/data/users.dart';
import 'package:emiliano_ex2p/models/user.dart';
import 'package:emiliano_ex2p/views/login_view.dart';
import 'package:flutter/material.dart';

class RegistroView extends StatefulWidget {
  const RegistroView({Key? key}) : super(key: key);

  @override
  _RegistroViewState createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  //Variables
  TextEditingController username = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  String estado = '';
  String escolaridad = '';
  String habilidades = '';
  String valueString = 'Escolaridad';
  String? status;
  bool javaselected = false;
  bool cselected = false;
  bool csselected = false;
  List<String> items = <String>[
    'Escolaridad',
    'Licenciatura',
    'Maestría',
    'Doctorado'
  ];
  final GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScaffoldMessenger(
        key: key,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()));
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text('                       Registro'),
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Nombre',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                      controller: name,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Usuario',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                      controller: username,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Constraseña',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                      controller: password,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Estado civil',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepPurple, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Soltero(a)'),
                      Radio(
                          activeColor: Colors.deepPurple,
                          value: 'Soltero(a)',
                          groupValue: status,
                          onChanged: (value) {
                            setState(() {
                              status = value.toString();
                              estado = status!;
                            });
                          }),
                      const Text('Casado(a)'),
                      Radio(
                          activeColor: Colors.deepPurple,
                          value: 'Casado(a)',
                          groupValue: status,
                          onChanged: (value) {
                            setState(() {
                              status = value.toString();
                              estado = status!;
                            });
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Escolaridad',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                    child: DropdownButton(
                      underline: Container(),
                      isExpanded: true,
                      dropdownColor: Colors.deepPurple,
                      iconEnabledColor: Colors.deepPurple,
                      onChanged: ((value) {
                        setState(() {
                          valueString = value!;
                          escolaridad = value;
                        });
                      }),
                      value: valueString,
                      items: items.map((e) {
                        return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                            ));
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Habilidades',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Java'),
                        Checkbox(
                            activeColor: Colors.deepPurple,
                            value: javaselected,
                            onChanged: (bool? value) {
                              setState(() {
                                habilidades += 'Java ';
                                javaselected = value!;
                              });
                            }),
                        const Text('C#'),
                        Checkbox(
                            activeColor: Colors.deepPurple,
                            value: csselected,
                            onChanged: (bool? value) {
                              setState(() {
                                habilidades += 'C# ';
                                csselected = value!;
                              });
                            }),
                        const Text('C++'),
                        Checkbox(
                            activeColor: Colors.deepPurple,
                            value: cselected,
                            onChanged: (bool? value) {
                              setState(() {
                                habilidades += 'C++ ';
                                cselected = value!;
                              });
                            }),
                      ],
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
                      user.add(User(username.text, name.text, password.text,
                          estado, escolaridad, habilidades));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validaciones() {
    if (username.text.isEmpty ||
        name.text.isEmpty ||
        password.text.isEmpty ||
        escolaridad.isEmpty ||
        escolaridad == 'Escolaridad' ||
        habilidades.isEmpty ||
        estado.isEmpty) {
      showAlert('Complete todos los campos');
      return false;
    }
    if (user.where((element) => username.text == element.usuario).isNotEmpty) {
      showAlert('Ya existe el usuario ingresado');
      return false;
    }
    return true;
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
