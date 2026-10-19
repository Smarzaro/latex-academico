# 04 – Prova com versões embaralhadas

**Problema.** Aplicar a mesma prova em versões diferentes, com as alternativas em outra ordem,
sem escrever cada versão à mão e com o gabarito certo de cada uma.

**Solução.** O pacote `exam-randomizechoices`, que sorteia a ordem das alternativas, com o número
da versão como semente do sorteio: a mesma versão gera sempre a mesma ordem, e outra versão gera
outra ordem. O número vem de fora, na hora de compilar. Exemplo completo:
[`prova-versoes.tex`](../../exemplos/avaliacoes/prova-versoes.tex).

## Preâmbulo

```latex
\usepackage{exam-randomizechoices}   % ambiente randomizechoices: alternativas em ordem sorteada
\providecommand{\versao}{1}          % versão padrão, se nenhuma for informada na compilação
\setrandomizerseed{\versao}          % a versão é a semente do sorteio: mesma versão, mesma ordem
\ifdefined\gabarito \printanswers \fi
```

- `\providecommand` só define `\versao` se ele ainda não existir: sem nada na compilação, sai a
  versão 1.
- `\ifdefined\gabarito \printanswers \fi` liga as respostas quando `\gabarito` é definido na
  compilação. Assim, prova e gabarito de cada versão saem do mesmo arquivo, sem editá-lo.
- Use `\versao` no cabeçalho (o exemplo escreve "Prova 1 --- versão \versao") para identificar a
  versão em cada página.

## Questões

As questões de múltipla escolha usam `randomizechoices` no lugar de `choices`, e a correta é
marcada com `\correctchoice`:

```latex
\begin{questions}
  \question[1]\label{q:comentario}
  Qual caractere inicia um comentário em um arquivo \texttt{.tex}?
  \begin{randomizechoices}
    \choice \texttt{\#}
    \correctchoice \texttt{\%}
    \choice \texttt{\&}
    \choice \texttt{\textbackslash}
  \end{randomizechoices}
  \begin{solution}
    Alternativa \altcorreta: o \texttt{\%} faz o \LaTeX\ ignorar o resto da linha.
  \end{solution}

  % ... demais questões de múltipla escolha ...

  \question[2]
  Explique a diferença entre uma tabela e um quadro nos trabalhos acadêmicos.
  \begin{solutionorlines}[2.5cm]
    A tabela apresenta dados, geralmente numéricos, com as laterais abertas; o quadro apresenta
    informação textual, com bordas em todos os lados.
  \end{solutionorlines}
\end{questions}
```

- Só a ordem das alternativas muda; a ordem das questões é a mesma em todas as versões.
- Cada questão precisa de exatamente uma `\correctchoice` (o pacote avisa quando há zero ou mais
  de uma).
- O pacote cria, para a alternativa correta da questão N, o rótulo `question@N@correctchoice`. O
  exemplo define no preâmbulo um atalho que lê esse rótulo e devolve a letra sorteada:
  `\newcommand{\altcorreta}{\ref{question@\thequestion @correctchoice}}`. Nunca escreva a letra
  da resposta à mão no `solution`: ela muda de uma versão para outra.
- O exemplo troca as letras para minúsculas com parêntese, a) b) c), redefinindo `\thechoice` e
  `\choicelabel`.

## Folha de respostas e chave de respostas

```latex
% Folha de respostas: os números das questões vêm dos \label de cada questão
\newcommand{\circulo}[1]{\textcircled{\footnotesize #1}}
\newcommand{\linhaMC}[1]{\ref{#1} & \circulo{a} & \circulo{b} & \circulo{c} & \circulo{d}\\[1ex]}
\newcommand{\folharespostas}{%
  \begin{center}
    \textbf{Folha de respostas: marque uma alternativa em cada questão}\par\smallskip
    \fbox{\begin{tabular}{c|cccc}
      \textbf{Questão} & a & b & c & d \\ \hline\rule{0pt}{2.6ex}
      \linhaMC{q:comentario}
      \linhaMC{q:biber}
      \linhaMC{q:label}
    \end{tabular}}
  \end{center}}
```

```latex
\ifprintanswers
  \bigskip\noindent\textbf{Chave de respostas --- versão \versao}\par\smallskip
  \printkeytable[1-3]
\fi
```

- A folha de respostas é chamada logo depois da identificação do aluno (`\folharespostas`). Ela
  traz uma linha por questão de múltipla escolha, com o número tirado do `\label`: se uma questão
  for inserida antes, a numeração da folha acompanha.
- A folha tem quatro colunas (a a d); com cinco alternativas, acrescente uma coluna no `tabular` e
  um `\circulo{e}` no `\linhaMC`.
- `\printkeytable[1-3]` imprime a tabela com a letra correta das questões 1 a 3 (a questão 4 é
  discursiva e fica de fora). Os títulos das colunas são definidos por `\keylistquestionname` e
  `\keylistkeyname`. Dentro de `\ifprintanswers`, a chave aparece só no gabarito.

## Compilar uma versão

```sh
latexmk -pdf prova-versoes.tex                                       # versão 1
latexmk -pdf -jobname=prova-v2 -usepretex="\def\versao{2} " prova-versoes.tex
latexmk -pdf -jobname=gabarito-v2 -usepretex="\def\versao{2}\def\gabarito{1} " prova-versoes.tex
```

- `-usepretex` insere o código antes da primeira linha do arquivo; `-jobname` dá outro nome ao PDF,
  para que uma versão não sobrescreva a outra.
- No Git Bash (Windows), deixe um espaço antes de fechar as aspas, depois da última `}`: sem ele,
  o argumento perde as barras invertidas e as chaves antes de chegar ao `latexmk`. No
  Linux, no macOS e no PowerShell o espaço não atrapalha.
- Para gerar várias versões de uma vez, use os scripts da [receita 05](05-gerar-versoes.md).

## Armadilhas

- Sem `-jobname`, todas as versões gravam o mesmo `prova-versoes.pdf` e o mesmo `.aux`: a última
  compilação apaga a anterior, e as letras da chave podem sair de uma ordem antiga até a próxima
  passagem.
- A semente fixa a ordem para uma mesma instalação; outra versão do pacote ou da distribuição pode
  sortear outra ordem. Guarde os PDFs aplicados junto com os respectivos gabaritos.
