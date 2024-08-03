import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Apelido extends StatefulWidget {
  final TextEditingController apelidoController;

  const Apelido(this.apelidoController, {super.key});

  @override
  State<StatefulWidget> createState() => _ApelidoState();
}

class _ApelidoState extends State<Apelido> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Digite um apelido:',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
              ),
            )),
        TextField(
          decoration: (const InputDecoration(labelText: "Apelido")),
          maxLength: 10,
          keyboardType: TextInputType.text,
          controller: widget.apelidoController,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
