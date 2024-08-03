import 'package:flutter/material.dart';
import 'pages/body_app.dart';
import 'pages/jogo_da_memoria.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jogo da memória',
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/jogo": (context) => JogoDaMemoria(),
        },
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Jogo da memória"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: const BodyApp(),
        ));
  }
}
