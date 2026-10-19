# 02 – Sudoku e dados

**Problema.** Imprimir uma grade de sudoku e sortear uma rolagem de dados dentro do documento.

**Solução.** O pacote `sudoku` para a grade; para os dados, o `epsdice` (faces de dado) com os
números aleatórios do PGF. Exemplo completo:
[`sudoku-dados.tex`](../../exemplos/diversao/sudoku-dados.tex).

```latex
\usepackage{sudoku}                   % ambiente sudoku
\usepackage{epsdice}                  % \epsdice{n}: face de um dado
\usepackage{pgffor, pgfmath}          % \foreach e números aleatórios
```

## Sudoku

```latex
\setlength{\sudokusize}{6cm}
\begin{center}
\begin{sudoku}
|5|3| | |7| | | | |.
|6| | |1|9|5| | | |.
| |9|8| | | | |6| |.
|8| | | |6| | | |3|.
|4| | |8| |3| | |1|.
|7| | | |2| | | |6|.
| |6| | | | |2|8| |.
| | | |4|1|9| | |5|.
| | | | |8| | |7|9|.
\end{sudoku}
\end{center}
```

- Cada linha da grade começa com `|`, separa as casas com `|` e termina com `|.`; uma casa vazia
  é um espaço entre duas barras. As linhas grossas dos blocos 3 × 3 são desenhadas pelo pacote.
- `\sudokusize` é o lado da grade inteira.
- Os algarismos usam `\sudokuformat`, que o pacote define como `\Huge\sffamily`. Em uma grade de
  6 cm eles ficam quase do tamanho da casa; para uma letra menor, redefina no preâmbulo:
  `\renewcommand*\sudokuformat[1]{\Large\sffamily#1}`.
- O pacote só desenha: confira se o enigma tem solução única antes de distribuí-lo.

## Rolagem de dados

```latex
\pgfmathsetseed{2026}
Rolagem de cinco dados:
\foreach \i in {1,...,5} {%
  \pgfmathrandominteger{\face}{1}{6}%
  \epsdice{\face}\ %
}
```

- `\pgfmathrandominteger{\face}{1}{6}` sorteia um inteiro de 1 a 6 e o guarda em `\face`;
  `\epsdice` desenha a face correspondente.
- A semente (`\pgfmathsetseed`) fixa a sequência sorteada: a mesma semente repete a mesma rolagem
  a cada compilação, o que é útil para que o PDF não mude sozinho. Troque o número para outra
  rolagem.
- Os `%` no fim das linhas evitam espaços indesejados entre as faces; o `\ ` põe um espaço
  explícito depois de cada dado.
