import 'package:emiliano_ex2p/data/users.dart';
import 'package:emiliano_ex2p/views/detail_view.dart';
import 'package:flutter/material.dart';

import 'login_view.dart';

class ListaView extends StatelessWidget {
  const ListaView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  icon: const Icon(Icons.logout)),
              const Text('                       Registro'),
            ],
          ),
        ),
        body: ListView.separated(
          separatorBuilder: ((context, index) {
            return const Divider(
              color: Colors.deepPurple,
            );
          }),
          itemCount: user.length,
          itemBuilder: (context, index) {
            final datos = user[index];
            return GestureDetector(
              onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailView(usuario: user[index])))),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(datos.nombre,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                leading: const Icon(
                  Icons.account_circle,
                  color: Colors.deepPurple,
                  size: 50,
                ),
                subtitle: Text(
                  datos.escolaridad,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
