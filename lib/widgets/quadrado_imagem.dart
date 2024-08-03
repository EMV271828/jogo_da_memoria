import 'package:flutter/material.dart';
import '../metodos_classes_auxiliares/comparacao.dart';

class QuadradoImagem extends StatefulWidget {
  final int index;
  Map valoresDoJogo;
  final Function() _atualizar;
  List valoresDosQuadrados;

  QuadradoImagem(
      this.index, this.valoresDoJogo, this._atualizar, this.valoresDosQuadrados,
      {super.key});

  @override
  State<StatefulWidget> createState() => _QuadradoImagemState();
}

class _QuadradoImagemState extends State<QuadradoImagem> {
  @override
  Widget build(BuildContext context) {
    escolherLado() {
      if (widget.valoresDosQuadrados[widget.index][1] == 0) {
        return Container(
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.all(5),
            color: Colors.cyan);
      }
      return Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            widget.valoresDosQuadrados[widget.index][0],
            width: 80,
            height: 80,
            fit: BoxFit.fill,
          ));
    }

    return GestureDetector(
      onTap: () async {
        if (widget.valoresDosQuadrados[widget.index][1] == 0 &&
            !widget.valoresDoJogo['bloqueio']) {
          setState(() {
            widget.valoresDosQuadrados[widget.index][1] = 1;
          });

          int resultado = comparacao(
              widget.valoresDoJogo, widget.valoresDosQuadrados, widget.index);

          if (resultado == -1) {
            widget.valoresDoJogo['selecionado'] = widget.index;
          } else if (resultado == 1) {
            widget.valoresDoJogo['restantes'] -= 2;
            widget.valoresDoJogo['selecionado'] = -1;
          } else {
            widget.valoresDoJogo['bloqueio'] = true;
            widget._atualizar();
            await Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                widget.valoresDosQuadrados[widget.index][1] = 0;
                widget.valoresDosQuadrados[
                widget.valoresDoJogo['selecionado']][1] = 0;
              });
              widget.valoresDoJogo['tentativas'] -= 1;
              widget.valoresDoJogo['selecionado'] = -1;
            });
            widget.valoresDoJogo['bloqueio'] = false;
          }
        }
        widget._atualizar();
      },
      child: escolherLado(),
    );
  }
}
