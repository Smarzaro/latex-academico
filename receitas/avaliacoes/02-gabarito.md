# 02 – Gabarito do mesmo arquivo

**Problema.** Ter a prova e o gabarito sem manter dois arquivos com o mesmo texto, que acabam
divergindo quando uma questão é corrigida.

**Solução.** Escrever as respostas dentro da prova (ambientes `solution`, `solutionorbox`,
`solutionorlines` e `\CorrectChoice`, veja a [receita 01](01-prova.md)) e criar um segundo arquivo,
de duas linhas, que liga a opção `answers` e lê a prova. Exemplo completo:
[`gabarito.tex`](../../exemplos/avaliacoes/gabarito.tex), que usa
[`prova.tex`](../../exemplos/avaliacoes/prova.tex).

```latex
\PassOptionsToClass{answers}{exam}
\input{prova}
```

```sh
latexmk -pdf prova.tex       # prova.pdf: espaços em branco, caixas e linhas
latexmk -pdf gabarito.tex    # gabarito.pdf: as respostas no lugar dos espaços
```

- `\PassOptionsToClass` precisa vir antes do `\documentclass`, que está dentro de `prova.tex`: por
  isso ele é a primeira linha do arquivo do gabarito.
- Com `answers`, as respostas são impressas (em uma caixa, no caso de `solutionorbox`), a
  alternativa correta fica destacada e os espaços reservados dão lugar às respostas: a paginação
  do gabarito pode ser diferente da paginação da prova.
- Os dois PDFs têm nomes diferentes porque vêm de arquivos diferentes; nenhum sobrescreve o outro.
- Outra forma, sem segundo arquivo: `\printanswers` no preâmbulo da prova (e `\noprintanswers`
  para voltar). Assim é fácil esquecer o gabarito ligado e imprimir a prova com as respostas; o
  arquivo separado evita esse erro.
- Os dois arquivos ficam na mesma pasta: o `\input{prova}` procura `prova.tex` na pasta atual.

Para o gabarito de uma prova com versões, veja a [receita 04](04-prova-com-versoes.md).
