import 'package:flutter/material.dart';

class Dificuldade extends StatefulWidget {
  final List dificuldade;
  final int index;
  final Function() atualizar;

  const Dificuldade(this.dificuldade, this.index, this.atualizar, {super.key});

  @override
  State<StatefulWidget> createState() => _DificuldadeState();
}

class _DificuldadeState extends State<Dificuldade> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: widget.dificuldade[widget.index][1],
        title: Text(
          widget.dificuldade[widget.index][0],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        activeColor: Colors.red,
        onChanged: (bool? valor) {
          if (valor == true) {
            widget.dificuldade[widget.index][1] = valor;
            widget.dificuldade[(widget.index + 1) % 3][1] = !valor!;
            widget.dificuldade[(widget.index + 2) % 3][1] = !valor!;
          } else{
            widget.dificuldade[widget.index][1] = valor;
          }
          setState(() {});
          widget.atualizar();
        });
  }
}
