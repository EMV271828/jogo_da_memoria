import 'package:flutter/material.dart';

class OpcoesJogo extends StatefulWidget {
  final List opcaoValor;
  final int index;

  const OpcoesJogo(this.opcaoValor, this.index, {super.key});

  @override
  State<StatefulWidget> createState() => _OpcoesState();
}

class _OpcoesState extends State<OpcoesJogo> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: widget.opcaoValor[widget.index]?[0],
        title: Text(
          widget.opcaoValor[widget.index]?[1],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(widget.opcaoValor[widget.index]?[2]),
        activeColor: Colors.red,
        onChanged: (bool? valor) {
          setState(() {
            widget.opcaoValor[widget.index]?[0] = valor;
          });
        });
  }
}
