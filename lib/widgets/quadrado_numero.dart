import 'dart:io';

import 'package:flutter/material.dart';
import '../metodos_classes_auxiliares/comparacao.dart';

class QuadradoNumero extends StatefulWidget {
  int index;
  List valoresDosQuadrados;
  Map valoresDoJogo;
  final Function() _atualizar;

  QuadradoNumero(this.index, this.valoresDoJogo, this._atualizar,
      this.valoresDosQuadrados,
      {super.key});

  @override
  State<StatefulWidget> createState() => _QuadradoNumeroState();
}

class _QuadradoNumeroState extends State<QuadradoNumero> {
  @override
  Widget build(BuildContext context) {
    escolherLado() {
      if (widget.valoresDosQuadrados[widget.index][1] == 0) {
        return Container(
          color: Colors.cyan,
          padding: EdgeInsets.all(40),
          margin: const EdgeInsets.all(5),
        );
      }

      return Container(
          color: Colors.cyan,
          padding: const EdgeInsets.fromLTRB(36, 36, 36, 36),
          margin: const EdgeInsets.all(5),
          child: Text('${widget.valoresDosQuadrados[widget.index][0]}',
              style: const TextStyle(height: 0.5)));
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
        child: escolherLado());
  }
}
