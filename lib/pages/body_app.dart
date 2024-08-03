import 'package:flutter/material.dart';
import '../metodos_classes_auxiliares/transferencia_de_dados.dart';
import '../widgets/apelido.dart';
import '../widgets/dificuldade.dart';
import '../widgets/opcoes_jogo.dart';

class BodyApp extends StatefulWidget {
  const BodyApp({super.key});

  @override
  State<StatefulWidget> createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  final TextEditingController _apelidoController = TextEditingController();
  List opcaoValor = [
    [false, 'Imagens', 'Conterá apenas imagens se for a única selecionada'],
    [false, 'Números', 'Conterá apenas números se for a única selecionada'],
  ];

  List dificuldade = [
    ["Fácil", false],
    ["Médio", false],
    ["Difícil", false]
  ];

  _atualizar() {
    setState(() {});
  }

  _selecionarDificuldade() {
    if (dificuldade[0][1] == true) {
      return 50;
    } else if (dificuldade[1][1] == true) {
      return 20;
    }
    return 10;
  }

  _registrar() {
    if (_apelidoController.text == "" ||
        (opcaoValor[0][0] == false && opcaoValor[1][0] == false) ||
        (dificuldade[0][1] == false &&
            dificuldade[1][1] == false &&
            dificuldade[2][1] == false)) {
      return;
    }

    Navigator.pushNamed(context, "/jogo",
        arguments: TransferenciaDeDados(_apelidoController.text,
            [opcaoValor[0][0], opcaoValor[1][0]], _selecionarDificuldade()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Apelido(_apelidoController),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: const Text(
                  'Escolha uma ou mais opções abaixo:',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            OpcoesJogo(opcaoValor, 0),
            OpcoesJogo(opcaoValor, 1),
            Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 5)),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: const Text(
                  'Escolha uma dificuldade abaixo:',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: Dificuldade(dificuldade, 0, _atualizar)),
                Expanded(child: Dificuldade(dificuldade, 1, _atualizar)),
                Expanded(child: Dificuldade(dificuldade, 2, _atualizar)),
              ],
            ),
            Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 30)),
            ElevatedButton(onPressed: _registrar, child: const Text("Iniciar")),
          ],
        ));
  }
}
