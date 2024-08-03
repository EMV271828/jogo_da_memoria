import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/quadrado_numero.dart';
import '../widgets/quadrado_imagem.dart';

gerarValores() {
  List valores = [];

  while (valores.length != 20) {
    int num = Random().nextInt(10);
    if (!valores.contains(num)) {
      valores.add(num);
      valores.add(num);
    }
  }

  for (int i = 0; i < 10; i++) {
    //valor do quadrado, posicao
    valores[2 * i] = [valores[2 * i], 0];
    valores[2 * i + 1] = [valores[2 * i + 1], 0];
  }

  return valores;
}

adicionarModoDeJogo(List modoDeJogo) {
  List valores = gerarValores();

  // imagens e numeros
  if (modoDeJogo[0] && modoDeJogo[1]) {
    for (int i = 0; i < 5; i++) {
      valores[2 * i][0] = 'images/g${valores[2 * i][0]}.jpg';
      valores[2 * i + 1][0] = 'images/g${valores[2 * i + 1][0]}.jpg';
    }
    valores.shuffle();
    valores.add(2);
    return valores;
  }

  // numeros
  else if (modoDeJogo[0] == false) {
    valores.shuffle();
    valores.add(1);
    return valores;
  }

  //imagens
  for (int i = 0; i < 10; i++) {
    valores[2 * i][0] = 'images/g${valores[2 * i][0]}.jpg';
    valores[2 * i + 1][0] = 'images/g${valores[2 * i + 1][0]}.jpg';
  }

  valores.shuffle();
  valores.add(0);

  return valores;
}

gerarQuadrados(List valoresDosQuadrados, valoresDoJogo, Function() _atualizar) {
  if (valoresDosQuadrados[20] == 1) {
    return Column(children: [
      for (int i = 0; i < 5; i++)
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int j = i * 4; j < i * 4 + 4; j++)
            QuadradoNumero(j, valoresDoJogo, _atualizar, valoresDosQuadrados)
        ])
    ]);
  } else if (valoresDosQuadrados[20] == 0) {
    return Column(children: [
      for (int i = 0; i < 5; i++)
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int j = i * 4; j < i * 4 + 4; j++)
            QuadradoImagem(j, valoresDoJogo, _atualizar, valoresDosQuadrados)
        ])
    ]);
  }

  return Column(children: [
    for (int i = 0; i < 5; i++)
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        for (int j = i * 4; j < i * 4 + 4; j++)
          if (valoresDosQuadrados[j][0] is String)
            QuadradoImagem(j, valoresDoJogo, _atualizar, valoresDosQuadrados)
          else
            QuadradoNumero(j, valoresDoJogo, _atualizar, valoresDosQuadrados)
      ])
  ]);
}
