import 'package:flutter/material.dart';
import '../metodos_classes_auxiliares/criacao_de_quadrados.dart';
import '../metodos_classes_auxiliares/transferencia_de_dados.dart';
import '../widgets/quadrados.dart';

class JogoDaMemoria extends StatefulWidget {
  const JogoDaMemoria({super.key});

  @override
  State<StatefulWidget> createState() => _JogoDaMemoriaState();
}

class _JogoDaMemoriaState extends State<JogoDaMemoria> {
  @override
  Widget build(BuildContext context) {
    atualizar() => setState(() {});

    final opcoesDeJogo =
        ModalRoute.of(context)!.settings.arguments as TransferenciaDeDados;

    List valoresDosQuadrados = adicionarModoDeJogo(opcoesDeJogo.modoDeJogo);

    return Quadrados(
        apelido: opcoesDeJogo.apelido,
        valoresDosQuadrados: valoresDosQuadrados,
        tentativas: opcoesDeJogo.dificuldade,
        atualizarJogo: atualizar);
  }
}
