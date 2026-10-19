# 07 – Palavras cruzadas

**Problema.** Fazer palavras cruzadas para uma aula ou lista (aqui, com termos do LaTeX), com as
pistas numeradas e uma versão com a solução, sem manter dois arquivos.

**Solução.** O pacote `cwpuzzle` (do conjunto `crossword`), com a grade escrita casa a casa, e um
segundo arquivo que liga a solução e lê o primeiro, como o gabarito de uma prova. Exemplo
completo: [`palavras-cruzadas.tex`](../../exemplos/diversao/palavras-cruzadas.tex); solução em
[`palavras-cruzadas-solucao.tex`](../../exemplos/diversao/palavras-cruzadas-solucao.tex) e,
como texto, em
[`solucao-palavras-cruzadas.md`](../../exemplos/diversao/solucao-palavras-cruzadas.md).

```latex
\usepackage{cwpuzzle}                 % ambientes Puzzle e PuzzleClues
\usepackage{qrcode}
\usepackage{multicol}
\ifdefined\solucao \PuzzleSolution \fi   % a solução preenche as casas
```

## Grade

```latex
\begin{center}
\begin{Puzzle}{14}{15}
  |{} |[1]E |{} |[2]I |{} |{} |{} |{} |{} |{} |{} |{} |[3]O |{} |.
  |{} |X |{} |T |{} |{} |{} |{} |{} |{} |{} |{} |V |{} |.
  |[4]L |A |B |E |L |{} |{} |{} |{} |{} |{} |{} |E |{} |.
  % ... demais linhas da grade ...
  |{} |{} |{} |{} |{} |{} |{} |K |{} |{} |{} |{} |{} |{} |.
\end{Puzzle}
\end{center}
```

- `\begin{Puzzle}{colunas}{linhas}`: aqui, 14 colunas e 15 linhas. Cada linha tem exatamente uma
  casa por coluna e termina com `|.`.
- Uma casa com letra é `|L`; com o número da pista, `|[4]L`. A letra fica escondida na grade
  vazia e aparece na solução.
- `|{}` é uma casa fora do jogo: não recebe moldura. Assim, só as casas das palavras aparecem.
- Escreva a grade antes em papel quadriculado ou em uma planilha e confira os cruzamentos: a
  letra comum a duas palavras é uma casa só.

## Pistas

```latex
\begin{multicols}{2}\small\raggedright
\begin{PuzzleClues}{\textbf{Horizontais}}
  \Clue{4}{LABEL}{Comando que dá nome a um elemento para a referência cruzada}
  \Clue{5}{FIGURE}{Ambiente flutuante para ilustrações}
  % ... demais pistas horizontais ...
\end{PuzzleClues}
\begin{PuzzleClues}{\textbf{Verticais}}
  \Clue{1}{EXAM}{Classe para provas e listas de exercícios}
  \Clue{2}{ITEMIZE}{Ambiente de lista com marcadores}
  % ... demais pistas verticais ...
\end{PuzzleClues}
\end{multicols}
```

- `\Clue{número}{resposta}{pista}`: o número deve ser o mesmo da casa `[n]` em que a palavra
  começa. A resposta não é impressa na grade vazia.
- As pistas são compostas em sequência, como um parágrafo; o `multicols` as distribui em duas
  colunas e o `\raggedright` evita espaços grandes entre as palavras.
- Palavras com acento ou cedilha não cabem bem em uma casa por letra: o exemplo escreve
  PREAMBULO sem acento e avisa isso na pista.

## Solução do mesmo arquivo

```latex
\def\solucao{}
\input{palavras-cruzadas}
```

```sh
latexmk -pdf palavras-cruzadas.tex           # grade vazia
latexmk -pdf palavras-cruzadas-solucao.tex   # grade preenchida
```

- `\solucao` é definido antes de ler o arquivo; no preâmbulo, `\ifdefined\solucao \PuzzleSolution
  \fi` liga o modo de solução, que escreve as letras nas casas. Nesse modo, os números das casas
  e as listas de pistas não são impressos: a folha de solução mostra só a grade preenchida.
- A folha das palavras cruzadas traz ainda um QR code que leva à solução publicada no guia:

```latex
\begin{center}
  \qrcode[height=2cm]{https://github.com/Smarzaro/latex-academico/blob/main/exemplos/diversao/solucao-palavras-cruzadas.md}\\[2pt]
  \footnotesize Solução no guia
\end{center}
```

  Para as suas palavras cruzadas, troque o endereço pelo da sua solução (veja a
  [receita 06](06-qrcode.md)).

## Lista de conferência

- Cada linha da grade tem o número de casas declarado no `Puzzle`?
- Todo número `[n]` da grade tem a sua pista, na lista certa (horizontal ou vertical)?
- A solução compilada mostra as palavras certas em todos os cruzamentos?
- O arquivo de solução publicado confere com a grade atual?
