# 04 – Programação

**Problema.** Em material de introdução à programação, desenhar um fluxograma com os símbolos
usuais (início e fim, entrada e saída, processo, decisão) e apresentar o mesmo raciocínio como
algoritmo em português estruturado.

**Solução.** TikZ com um estilo para cada tipo de símbolo e o pacote `algorithm2e` com a opção
`portuguese`. Exemplo completo: [`programacao.tex`](../../exemplos/areas/programacao.tex).

```latex
\usepackage{tikz}
\usetikzlibrary{shapes.geometric, shapes.misc, positioning}
\usepackage[portuguese, ruled, linesnumbered]{algorithm2e}
```

## Fluxograma

```latex
\begin{center}
\begin{tikzpicture}[node distance=7mm, font=\small,
    terminal/.style={draw, rounded rectangle, minimum width=2cm},
    processo/.style={draw, rectangle, minimum width=2.6cm, minimum height=7mm},
    decisao/.style={draw, diamond, aspect=2, inner sep=1pt},
    es/.style={draw, trapezium, trapezium left angle=70, trapezium right angle=110},
    seta/.style={-stealth}]
  \node[terminal]                     (ini)  {início};
  \node[es, below=of ini]             (le)   {ler $n_1$, $n_2$};
  \node[processo, below=of le]        (med)  {$m \gets (n_1 + n_2)/2$};
  \node[decisao, below=of med]        (dec)  {$m \ge 6$?};
  \node[es, below left=7mm and 10mm of dec]  (apr) {``aprovado''};
  \node[es, below right=7mm and 10mm of dec] (rep) {``reprovado''};
  \node[terminal, below=18mm of dec]  (fim)  {fim};
  \draw[seta] (ini) -- (le);
  \draw[seta] (le) -- (med);
  \draw[seta] (med) -- (dec);
  \draw[seta] (dec) -| node[pos=0.3, above] {sim} (apr);
  \draw[seta] (dec) -| node[pos=0.3, above] {não} (rep);
  \draw[seta] (apr) |- (fim);
  \draw[seta] (rep) |- (fim);
\end{tikzpicture}
\end{center}
```

- Um estilo por símbolo: `terminal` (retângulo de pontas arredondadas, da biblioteca
  `shapes.misc`), `es` (paralelogramo de entrada e saída, feito com `trapezium` e ângulos
  suplementares), `processo` (retângulo) e `decisao` (losango; `aspect=2` o deixa mais largo que
  alto). Trocar a aparência de todos os símbolos de um tipo é mudar uma linha.
- `below=of ini` (biblioteca `positioning`) empilha os nós com a distância de `node distance`;
  `below left=7mm and 10mm of dec` dá as distâncias vertical e horizontal separadas.
- `-|` traça a seta primeiro na horizontal e depois na vertical; `|-`, o contrário. Com
  `pos=0.3`, o rótulo ("sim", "não") fica no trecho horizontal.
- O `\gets` (seta para a esquerda) é a atribuição, a mesma notação do algoritmo.

## Algoritmo

```latex
\begin{algorithm}[htbp]
  \caption{Fatorial de um número natural}
  \Entrada{um número natural $n$}
  \Saida{$n!$}
  $f \gets 1$\;
  \Para{$i \gets 2$ \Ate $n$}{
    $f \gets f \times i$\;
  }
  \Retorna{$f$}\;
\end{algorithm}
```

- Com `portuguese`, os comandos do `algorithm2e` ganham nomes em português (`\Entrada`, `\Saida`,
  `\Para`, `\Ate`, `\Retorna`, `\Enqto`, `\eSe`...) e o título vira "Algoritmo".
- Cada instrução termina com `\;`, que imprime o ponto e vírgula e encerra a linha. O corpo de
  `\Para` vai entre chaves.
- `ruled` põe filetes acima e abaixo e o título no alto; `linesnumbered` numera as linhas.
- O `algorithm2e` define o próprio ambiente `algorithm` e não convive com os pacotes
  `algorithm`/`algpseudocodex` no mesmo documento: escolha um dos dois estilos (veja a
  [receita 02](02-estruturas-de-dados.md)).
