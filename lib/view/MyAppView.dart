import 'package:flutter/material.dart';
import 'package:login/view/ListagemView.dart';
import 'package:login/view/MyHomePageView.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        '/listagem': (context) => const ListagemView(),
        '/listagem-especifica': (context) => const ListagemEspecificaView(),
      },
    );
  }
}