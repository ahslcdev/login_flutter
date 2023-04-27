import 'package:flutter/material.dart';
import 'package:login/db/Db.dart';

import '../model/UserModel.dart';

int ID = 0;
class ListagemView extends StatefulWidget {
  const ListagemView({super.key});

  @override
  State<ListagemView> createState() => _ListagemViewState();
}

class _ListagemViewState extends State<ListagemView> {

  Database database = Database();
  List<UserModel> data = [];
  String dados = "";
  // final List<String> items;

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
      body: ListView.builder(
          itemCount: data.length,
          // prototypeItem: ListTile(
          //   title: Text("$data 123"),
          // ),
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                ID = index;
                Navigator.pushNamed(context, '/listagem-especifica');
              },
              title: Text("${data[index].username}"),
            );
          },
        ),
    );
  }
}


class ListagemEspecificaView extends StatefulWidget {
  const ListagemEspecificaView({super.key});

  @override
  State<ListagemEspecificaView> createState() => _ListagemEspecificaViewState();
}

class _ListagemEspecificaViewState extends State<ListagemEspecificaView> {

  Database database = Database();
  List<UserModel> data = [];
  String dados = "";

  void usuarios () async {
    data = await database.getUser(ID);
    setState(() {
      for(int i = 0;i < data.length;i++){
        dados += "ID: ${data[i].id}\n";
        dados += "Username: ${data[i].username}\n";
        dados += "Password: ${data[i].password}\n";
      }
    });
  }
  @override
  void initState() {
    super.initState();
    usuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de usuários'),
        backgroundColor: Colors.green,
        
      ),
      body: Center(
        child: Text(dados)
      )
    );
  }
}