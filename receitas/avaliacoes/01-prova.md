# 01 – Prova com a classe `exam`

**Problema.** Montar uma prova com cabeçalho, identificação do aluno, questões com pontos (algumas
divididas em itens), uma questão de múltipla escolha, espaço para a resposta e o quadro de
pontuação, sem calcular nada à mão.

**Solução.** A classe `exam` com a opção `addpoints`, que soma os pontos de cada questão e de
cada item. Exemplo completo: [`prova.tex`](../../exemplos/avaliacoes/prova.tex).

```latex
\documentclass[12pt, a4paper, addpoints]{exam}   % addpoints: soma os pontos das questões
\usepackage[T1]{fontenc}
\usepackage[brazilian]{babel}
\usepackage{amsmath}
```

A classe tem textos fixos em inglês ("points", "Solution:", "Question", "Total"); troque-os no
preâmbulo:

```latex
% textos da classe em português
\pointpoints{ponto}{pontos}
\renewcommand{\solutiontitle}{\noindent\textbf{Resposta:}\enspace}
\hqword{Questão:} \hpword{Valor:} \hsword{Nota:} \htword{Total}   % quadro de pontuação
\CorrectChoiceEmphasis{\bfseries}
```

## Cabeçalho, rodapé e identificação

```latex
\pagestyle{headandfoot}
\firstpageheader{Cálculo I}{Prova 1}{\today}
\runningheader{Cálculo I}{Prova 1 (continuação)}{}
\footer{}{Página \thepage\ de \numpages}{}
\runningheadrule
```

```latex
\noindent Nome: \makebox[0.55\textwidth]{\hrulefill} \hfill Matrícula: \makebox[3cm]{\hrulefill}

\begin{center}
  \gradetable[h][questions]
\end{center}
```

- Os três argumentos de `\firstpageheader`, `\runningheader` e `\footer` são as partes esquerda,
  central e direita. O cabeçalho da primeira página pode ser diferente do das demais.
- `\numpages` e o quadro de pontuação usam o arquivo `.aux`: são necessárias duas compilações (o
  `latexmk` faz isso sozinho).
- `\gradetable[h][questions]` monta o quadro na horizontal, com uma coluna por questão; `[v]` o
  monta na vertical, e `[pages]` no lugar de `[questions]` soma por página.

## Questões

```latex
\begin{questions}
  \question[2] Calcule a derivada de $f(x) = 3x^2 + 2x$.
  \begin{solutionorbox}[2cm]      % na prova: caixa vazia; no gabarito: a resposta
    $f'(x) = 6x + 2$.
  \end{solutionorbox}

  \question Considere $g(x) = x^3$.
  \begin{parts}
    \part[1] Calcule $g'(2)$.
    \begin{solution}[1cm] $g'(x) = 3x^2$, logo $g'(2) = 12$. \end{solution}
    \part[2] Escreva a equação da reta tangente ao gráfico de $g$ em $x = 2$.
    \begin{solutionorlines}[2cm]
      $y = 12x - 16$.
    \end{solutionorlines}
  \end{parts}

  \question[1] Qual é a derivada de $\sin x$?
  \begin{choices}
    \choice $-\cos x$
    \CorrectChoice $\cos x$
    \choice $\sin x$
    \choice $-\sin x$
  \end{choices}
\end{questions}
```

- `\question[n]` dá `n` pontos à questão. Quando a questão tem itens, ponha os pontos nos `\part`
  e não na `\question`: o total da questão é a soma dos itens.
- O espaço de resposta na prova depende do ambiente: `solution[1cm]` deixa um espaço em branco,
  `solutionorbox[2cm]` desenha uma caixa e `solutionorlines[2cm]` traça linhas para escrever.
  Sem o argumento opcional, nenhum espaço é reservado.
- A alternativa correta é marcada com `\CorrectChoice` e só aparece destacada (em negrito, pelo
  `\CorrectChoiceEmphasis`) no gabarito; na prova ela é igual às demais.
- `oneparchoices` no lugar de `choices` põe as alternativas curtas na mesma linha.
- Confira as quebras de página no PDF: se uma questão começar no pé de uma página e continuar na
  seguinte, ponha um `\newpage` antes dela.

O gabarito sai deste mesmo arquivo: veja a [receita 02](02-gabarito.md).
