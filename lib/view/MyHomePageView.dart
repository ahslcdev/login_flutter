import 'package:flutter/material.dart';
import 'package:login/db/Db.dart';

import '../model/UserModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final _formKey = GlobalKey<FormState>();

  final username_input = TextEditingController();
  final password_input = TextEditingController();

  void resultado() {
    setState(() {
      Database database = Database();
      var user = UserModel(
        username: username_input.text,
        password: password_input.text,
      );

      void dados() async {
        database.insertUser(user);
      }
      dados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de usuário'),
        backgroundColor: Colors.green,
        
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.all(60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: IconButton(
                      icon: Icon(Icons.person, size: 50, color: Colors.green),
                      onPressed: () {},
                    ),
                  ),
                  // TextField(keyboardType: TextInputType.number),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: username_input,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    controller: password_input,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          resultado();
                          // Navigator.pushNamed(context, '/second');
                        }
                        await showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Cadastro realizado com sucesso!"),
                              content: Text("O usuário ${username_input.text} foi cadastrado."),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        username_input.text = '';
                        password_input.text = '';
                        Navigator.popAndPushNamed(context, '/listagem');
                      },
                      child: Text('Cadastrar'),
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical:
                            20), //apply padding horizontal or vertical only
                    child: Text("Informe seus dados!",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}