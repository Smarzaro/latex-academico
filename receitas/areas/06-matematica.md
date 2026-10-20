# 06 – Matemática

**Problema.** Ir além das fórmulas: desenhar uma figura de geometria, mostrar a área sob uma
curva, apresentar uma simplificação passo a passo, montar uma tabela-verdade e escrever uma prova
em dedução natural.

**Solução.** O `tkz-euclide` para a geometria, o `pgfplots` com a biblioteca `fillbetween` para a
área, o `cancel` e o `mathtools` para as contas, um `tabular` para a tabela-verdade e o
`bussproofs` para as provas. Exemplo completo:
[`matematica.tex`](../../exemplos/areas/matematica.tex). Para gerar a tabela-verdade
automaticamente, veja o [exemplo com LuaLaTeX](#tabela-verdade-automática-com-lualatex), no fim
desta receita.

As fórmulas em si (modos, `align`, matrizes, `cases`, teoremas) estão no tema
[Matemática](../matematica/); aqui ficam os recursos de quem ensina ou escreve na área.

```latex
\usepackage{mathtools, amssymb}  % mathtools carrega o amsmath
\usepackage{cancel}              % \cancel{...}: termo riscado
\usepackage{tkz-euclide}         % geometria euclidiana (carrega o TikZ)
\usepackage{pgfplots}            % gráficos de funções
\pgfplotsset{compat=1.18}
\usepgfplotslibrary{fillbetween} % pinta a região entre duas curvas
\usepackage{bussproofs}          % árvores de prova (dedução natural)
```

## Geometria com `tkz-euclide`

```latex
Triângulo retângulo em $C$, com a circunferência inscrita de centro $I$:
\begin{center}
\begin{tikzpicture}
  \tkzDefPoints{0/0/C, 4/0/A, 0/3/B}
  \tkzDefTriangleCenter[in](A,B,C) \tkzGetPoint{I}
  \tkzDefPointBy[projection=onto A--C](I) \tkzGetPoint{T}
  \tkzDrawPolygon(A,B,C)
  \tkzDrawCircle[gray](I,T)
  \tkzMarkRightAngle(A,C,B)
  \tkzMarkAngle[size=0.8](B,A,C) \tkzLabelAngle[pos=1.15](B,A,C){$\alpha$}
  \tkzDrawPoints(A,B,C,I)
  \tkzLabelPoints[below](A,C) \tkzLabelPoints[left](B)
  \tkzLabelPoints[above right](I)
  \tkzLabelSegment[below](C,A){$b = 4$}
  \tkzLabelSegment[left](C,B){$a = 3$}
  \tkzLabelSegment[above right](A,B){$c = 5$}
\end{tikzpicture}
\end{center}
```

- O pacote trabalha como uma construção com régua e compasso: primeiro se **definem** os pontos
  (`\tkzDef...` seguido de `\tkzGetPoint`), depois se **desenha** (`\tkzDraw...`) e por último se
  **rotula** (`\tkzLabel...`, `\tkzMark...`). Nada aparece até o `\tkzDraw`.
- O centro da circunferência inscrita (`in`, o incentro) é calculado pelo pacote; a circunferência
  é desenhada pelo centro e por um ponto dela, o pé `T` da perpendicular de `I` sobre um lado. Com
  `circum` no lugar de `in` sai a circunferência circunscrita.
- Os ângulos são dados por três pontos, com o vértice no meio: `(B,A,C)` é o ângulo em `A`.
- O código usa a sintaxe da versão 5 do pacote (TeX Live 2024 ou mais recente). Exemplos
  antigos, de antes da versão 4, podem usar comandos que mudaram de nome ou de opções.

## Área sob a curva com `pgfplots`

```latex
A área sob $f(x) = x^2/2 + 1$ entre $x = 1$ e $x = 3$ é
$\int_1^3 f(x)\,dx = \frac{19}{3}$:
\begin{center}
\begin{tikzpicture}
  \begin{axis}[axis lines=middle, xlabel={$x$}, ylabel={$y$},
      xmin=0, xmax=4, ymin=0, ymax=7, xtick={1,3}, ytick=\empty,
      width=7cm, height=5.5cm]
    \addplot[name path=f, thick, domain=0:3.6, samples=50]
      {x^2/2 + 1} node[left, pos=0.9] {$f$};
    \path[name path=eixo] (axis cs:0,0) -- (axis cs:4,0);
    \addplot[gray!30] fill between[of=f and eixo,
      soft clip={domain=1:3}];
  \end{axis}
\end{tikzpicture}
\end{center}
```

- A biblioteca `fillbetween` pinta a região entre dois caminhos com nome (`name path`): aqui, a
  curva `f` e o eixo $x$, um caminho invisível (`\path`).
- `soft clip={domain=1:3}` limita a pintura aos limites de integração; sem ele, toda a região
  entre a curva e o eixo seria pintada.
- `axis lines=middle` cruza os eixos na origem, como nos livros de Cálculo. Para gráficos de
  dados (barras, linhas), veja a [receita de PGFPlots](../figuras/04-graficos-pgfplots.md).

## Simplificação passo a passo

```latex
\begin{align*}
  \lim_{x \to 2} \frac{x^2 - 4}{x - 2}
    &= \lim_{x \to 2} \frac{(x + 2)\cancel{(x - 2)}}{\cancel{x - 2}}
    && \text{diferença de quadrados} \\
    &= \lim_{x \to 2} (x + 2) = 4
    && \text{substituindo } x = 2
\end{align*}
\begin{align*}
  (a + b)^2 - (a - b)^2
    &= \underbrace{a^2 + 2ab + b^2}_{(a + b)^2}
     - \underbrace{(a^2 - 2ab + b^2)}_{(a - b)^2} \\
    &= \cancel{a^2} + 2ab + \cancel{b^2} - \cancel{a^2} + 2ab
     - \cancel{b^2} = 4ab
\end{align*}
```

- `\cancel{...}` risca o termo na diagonal; o pacote tem ainda `\bcancel` (diagonal inversa),
  `\xcancel` (X) e `\cancelto{0}{...}`, com uma seta até o valor.
- No `align*`, o `&&` abre uma coluna à direita para a justificativa de cada passo, alinhada em
  todas as linhas.
- `\underbrace{...}_{...}` nomeia uma parte da expressão; `\overbrace{...}^{...}` faz o mesmo
  por cima.
- Duas contas independentes ficam melhor em dois `align*`: num só, a coluna larga de uma empurra
  a outra para fora da margem.

## Tabela-verdade e conjuntos

```latex
\begin{center}
\begin{tabular}{cc|cccc}
  $p$ & $q$ & $p \land q$ & $p \lor q$ & $p \to q$
    & $p \leftrightarrow q$ \\ \hline
  V & V & V & V & V & V \\
  V & F & F & V & F & F \\
  F & V & F & V & V & F \\
  F & F & F & F & V & V \\
\end{tabular}
\end{center}
Conjuntos: $\mathbb{N} \subset \mathbb{Z} \subset \mathbb{Q}
\subset \mathbb{R}$, $A = \{x \in \mathbb{N} \mid x < 5\}$,
$A \cup B$, $A \cap B$, $A \setminus B$, $\overline{A}$
e $\emptyset$.
```

- A linha vertical separa as variáveis das fórmulas; o `\hline`, o cabeçalho das linhas.
- Os conectivos têm mais de um nome: `\land` e `\wedge` (e), `\lor` e `\vee` (ou), `\lnot` e
  `\neg` (não), `\to` e `\rightarrow` (implica). Escolha um e use sempre o mesmo.
- `\mathbb` vem do `amssymb`. Em `\{x \in \mathbb{N} \mid x < 5\}`, o `\mid` dá à barra o
  espaçamento de relação; uma `|` simples fica colada.
- Para diagramas de Venn, veja o exemplo [`venn.tex`](../../exemplos/figuras/venn.tex).

## Dedução natural com `bussproofs`

```latex
Dedução natural: \emph{modus ponens} e a comutatividade do $\land$.
\begin{center}
\AxiomC{$p \to q$}
\AxiomC{$p$}
\RightLabel{\small ${\to}E$}
\BinaryInfC{$q$}
\DisplayProof
\qquad
\AxiomC{$p \land q$}
\RightLabel{\small ${\land}E_2$}
\UnaryInfC{$q$}
\AxiomC{$p \land q$}
\RightLabel{\small ${\land}E_1$}
\UnaryInfC{$p$}
\RightLabel{\small ${\land}I$}
\BinaryInfC{$q \land p$}
\DisplayProof
\end{center}
```

- A prova é escrita de cima para baixo, como uma pilha: `\AxiomC` empilha uma premissa;
  `\UnaryInfC`, `\BinaryInfC` e `\TrinaryInfC` consomem uma, duas ou três e empilham a conclusão;
  `\DisplayProof` desenha a árvore.
- `\RightLabel` (ou `\LeftLabel`) vem **antes** da regra a que se refere.
- Alternativas: `ebproof` (mesma ideia, sintaxe de ambiente), `fitch` e `logicproof` (provas em
  linhas numeradas, no estilo de Fitch) e `prooftrees` (tableaux semânticos).

## Tabela-verdade automática com LuaLaTeX

O pacote `truthtable` calcula a tabela a partir das fórmulas, sem risco de erro de digitação.
Ele faz as contas em Lua e, por isso, **só funciona com LuaLaTeX**. Exemplo completo:
[`logica-truthtable.tex`](../../exemplos/areas/logica-truthtable.tex).

```latex
% !TEX program = lualatex
\documentclass[12pt, a4paper]{article}
\usepackage[brazilian]{babel}   % LuaLaTeX: sem fontenc nem inputenc
\usepackage{amssymb}
\usepackage{truthtable}         % só funciona com LuaLaTeX
```

```latex
% {variáveis}{cabeçalho delas}{fórmulas}{cabeçalho delas}{V}{F}
% & (e), | (ou), ! (não); >>(p;q) implica, <>(p;q) equivale,
% ^(p;q) ou exclusivo: argumentos separados por ponto e vírgula
\begin{center}
\begin{tabular}{cc|cccc}
  \truthtable{p,q}{$p$,$q$}
    {p & q, p | q, >>(p;q), <>(p;q)}
    {$p \land q$, $p \lor q$, $p \to q$, $p \leftrightarrow q$}
    {V}{F}
\end{tabular}
\end{center}
```

- **Como compilar.** A primeira linha, `% !TEX program = lualatex`, faz o TeXstudio usar o
  LuaLaTeX. No VS Code, escolha a receita *latexmk (lualatex)* do LaTeX Workshop (por padrão,
  ele ignora o comentário). No Overleaf, escolha em *Menu > Compiler > LuaLaTeX*; na linha de
  comando, `latexmk -lualatex logica-truthtable.tex`. Com pdfLaTeX, a compilação
  para com erro.
- O comando vai **dentro** de um `tabular` com uma coluna por variável e por fórmula; ele escreve
  o cabeçalho, o `\hline` e as linhas.
- Os seis argumentos: as variáveis (nomes simples, separados por vírgula), como elas aparecem no
  cabeçalho, as fórmulas, como elas aparecem no cabeçalho e os símbolos de verdadeiro e falso.
- E, ou e não são escritos entre os operandos (`p & q`, `p | q`, `!p`); implicação, equivalência
  e ou exclusivo são escritos como funções, com os argumentos separados por **ponto e vírgula**,
  porque a vírgula separa as colunas: `>>(p;q)`. Elas podem ser aninhadas:
  `>>(>>(p;q) & >>(q;r);>>(p;r))` é $(p \to q) \land (q \to r) \to (p \to r)$, a tautologia do
  segundo trecho do exemplo.
- `\truthtable` começa pela linha com tudo verdadeiro; `\truthtableasc`, pela linha com tudo
  falso.
- Em LuaLaTeX não se usa `\usepackage[T1]{fontenc}`: o motor já trabalha com fontes Unicode.
