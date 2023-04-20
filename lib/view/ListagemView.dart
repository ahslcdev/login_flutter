import 'package:flutter/material.dart';
import 'package:login/db/Db.dart';

import '../model/UserModel.dart';

class ListagemView extends StatefulWidget {
  const ListagemView({super.key});

  @override
  State<ListagemView> createState() => _ListagemViewState();
}

class _ListagemViewState extends State<ListagemView> {

  Database database = Database();
  List<UserModel> data = [];
  String dados = "";
  void usuarios () async {
    data = await database.users();
    setState(() {
      data = data;
      for (int i = 0; i < data.length; i++){
        dados += "${data[i]}\n";
      }
      print("entrei aqui paizao hehehe");
    });
  }
  @override
  void initState() {
    super.initState();
    // start fetching
    usuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de usuários'),
        backgroundColor: Colors.green,
        
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text("${dados}"),
        ),
      ),
    );
  }
}