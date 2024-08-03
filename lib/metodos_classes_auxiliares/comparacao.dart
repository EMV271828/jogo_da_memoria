import 'dart:io';

comparacao(Map valoresDoJogo, List valoresDosQuadrados, int selecaoAtual){
  if (valoresDoJogo['tentativas'] != 0) {

    if (valoresDoJogo['selecionado'] == -1) {
      return -1;
    }

    var selecionado = valoresDosQuadrados[valoresDoJogo['selecionado']][0];
    var atual = valoresDosQuadrados[selecaoAtual][0];

    selecionado = selecionado is String
        ? selecionado.split('images/g')[1].split('.')[0]
        : selecionado;

    atual = atual is String ? atual.split('images/g')[1].split('.')[0] : atual;

    if (selecionado == atual) {
      return 1;
    }
    return 0;
  }
}
