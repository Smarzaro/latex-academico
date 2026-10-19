# Provas e listas de exercícios

A classe `exam` foi feita para avaliações: numera questões, itens e alternativas, soma os pontos,
monta o quadro de pontuação e reserva o espaço de resposta. A mesma fonte gera a prova e o
gabarito, porque as respostas ficam escritas junto das questões e só aparecem quando a opção
`answers` está ativa. Com o pacote `exam-randomizechoices`, as alternativas saem em ordem sorteada
e cada número de versão gera sempre a mesma prova. Os exemplos compiláveis estão em
[`exemplos/avaliacoes/`](../../exemplos/avaliacoes/).

| Receita | O que resolve |
|---|---|
| [01 – Prova com a classe `exam`](01-prova.md) | Cabeçalho, pontos, itens, múltipla escolha, espaço de resposta e quadro de pontuação |
| [02 – Gabarito do mesmo arquivo](02-gabarito.md) | Imprimir as respostas sem duplicar o texto da prova |
| [03 – Lista de exercícios](03-lista-de-exercicios.md) | Lacunas, verdadeiro ou falso e respostas opcionais, sem pontuação |
| [04 – Prova com versões embaralhadas](04-prova-com-versoes.md) | `exam-randomizechoices`, versão como semente, folha e chave de respostas |
| [05 – Gerar várias versões de uma vez](05-gerar-versoes.md) | Scripts `gerar-versoes.sh` e `gerar-versoes.ps1`: prova e gabarito de cada versão |

## Lista de conferência

- O total de pontos do quadro de pontuação confere com o valor da prova?
- Toda questão tem a resposta escrita (`solution`, `solutionorbox`, `solutionorlines` ou a
  alternativa marcada como correta)?
- O gabarito foi compilado depois da última alteração da prova?
- Em provas com versões: cada versão tem exatamente uma alternativa correta por questão, e a chave
  de respostas impressa é a da mesma versão?
- O cabeçalho mostra o número da versão e o rodapé mostra "Página N de M"?
