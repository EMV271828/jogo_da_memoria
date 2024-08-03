import 'package:flutter/material.dart';
import '../metodos_classes_auxiliares/criacao_de_quadrados.dart';

class Quadrados extends StatefulWidget {
  final String apelido;
  final List valoresDosQuadrados;
  final int tentativas;
  final Function() atualizarJogo;

  const Quadrados(
      {super.key,
      required this.apelido,
      required this.valoresDosQuadrados,
      required this.tentativas,
      required this.atualizarJogo});

  @override
  State<StatefulWidget> createState() => _QuadradosState();
}

class _QuadradosState extends State<Quadrados> {
  _atualizar() => setState(() {});

  late Map valoresDoJogo = {
    'restantes': 20,
    'selecionado': -1,
    'tentativas': widget.tentativas,
    'bloqueio': false
  };

  @override
  Widget build(BuildContext context) {
    if (valoresDoJogo['restantes'] == 0 || valoresDoJogo['tentativas'] == 0) {
      String resultado = valoresDoJogo['restantes'] == 0
          ? 'Você Venceu! Parabéns!'
          : 'Você Perdeu! Mais sorte na próxima!';

      return Scaffold(
          appBar: AppBar(
            title: const Text('Jogo da Memória'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Text(resultado,
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        valoresDoJogo['restantes'] = 20;
                        valoresDoJogo['selecionado'] = -1;
                        valoresDoJogo['tentativas'] = widget.tentativas;
                        widget.atualizarJogo();
                      },
                      child: const Text('Reiniciar Jogo')),
                  Container(padding: const EdgeInsets.fromLTRB(0, 40, 40, 0)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/");
                      },
                      child: const Text('Sair'))
                ],
              )
            ],
          ));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Boa Sorte, ${widget.apelido}!'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Text('Tentativas: ${valoresDoJogo['tentativas']}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            gerarQuadrados(
                widget.valoresDosQuadrados, valoresDoJogo, _atualizar
            ),
          ],
        ));
  }
}
