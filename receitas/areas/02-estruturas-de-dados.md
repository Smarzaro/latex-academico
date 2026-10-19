# 02 – Estruturas de dados

**Problema.** Ilustrar uma árvore e uma lista encadeada e apresentar um algoritmo em pseudocódigo
com as palavras-chave em português, numerado e com legenda.

**Solução.** `forest` para a árvore, TikZ com nós de duas partes para a lista e `algpseudocodex`
(dentro do float `algorithm`) para o pseudocódigo. Exemplo completo:
[`estruturas-de-dados.tex`](../../exemplos/areas/estruturas-de-dados.tex).

```latex
\usepackage{forest}                  % árvores
\usetikzlibrary{shapes.multipart, positioning, calc}   % nós com duas partes (lista)
\usepackage{algorithm}               % float "Algoritmo"
\usepackage{algpseudocodex}          % pseudocódigo
\floatname{algorithm}{Algoritmo}
% palavras-chave em português
\algrenewcommand\algorithmicfunction{\textbf{função}}
\algrenewcommand\algorithmicwhile{\textbf{enquanto}}
\algrenewcommand\algorithmicdo{\textbf{faça}}
\algrenewcommand\algorithmicif{\textbf{se}}
\algrenewcommand\algorithmicthen{\textbf{então}}
\algrenewcommand\algorithmicelse{\textbf{senão}}
\algrenewcommand\algorithmicreturn{\textbf{retorne}}
```

## Árvore binária de busca

```latex
\begin{center}
\begin{forest}
  for tree={circle, draw, minimum size=2.2em, inner sep=1pt, s sep=1.5em}
  [50 [30 [20] [40]] [70 [60] [80, fill=yellow!40]]]
\end{forest}
\end{center}
```

- A árvore é escrita com colchetes: `[raiz [filho] [filho]]`. Cada nível de colchetes é um
  nível da árvore.
- `for tree={...}` aplica o estilo a todos os nós; `minimum size` iguala os círculos, mesmo com
  números de tamanhos diferentes, e `s sep` afasta os irmãos.
- Opções depois de uma vírgula valem só para aquele nó: `[80, fill=yellow!40]` destaca o nó
  buscado. Para impressão em preto e branco, prefira `fill=black!15`.
- O `forest` carrega o TikZ: o `\usetikzlibrary` pode vir logo depois dele.

## Lista encadeada

```latex
\begin{center}
\begin{tikzpicture}[
    no/.style={draw, rectangle split, rectangle split parts=2,
               rectangle split horizontal, minimum height=2.2em},
    seta/.style={-stealth, thick}]
  \node[no] (a) {12 \nodepart{two} \phantom{0}};
  \node[no, right=1cm of a] (b) {7 \nodepart{two} \phantom{0}};
  \node[no, right=1cm of b] (c) {31 \nodepart{two} \phantom{0}};
  \node[left=1cm of a] (ini) {\texttt{início}};
  \node[right=1cm of c] (nulo) {\textsc{nulo}};
  \draw[seta] (ini) -- (a);
  \foreach \x/\y in {a/b, b/c, c/nulo}
    \draw[seta] ($(\x.one split)!0.5!(\x.east)$) -- (\y);
\end{tikzpicture}
\end{center}
```

- `rectangle split` (biblioteca `shapes.multipart`) divide o nó em partes: a primeira guarda o
  valor e a segunda, depois de `\nodepart{two}`, o ponteiro. O `\phantom{0}` dá largura à parte
  vazia.
- A seta sai do meio da segunda parte: `($(\x.one split)!0.5!(\x.east)$)` é o ponto entre a
  divisória e a borda direita (sintaxe da biblioteca `calc`).
- Para uma lista duplamente encadeada, use `rectangle split parts=3` e uma segunda seta, que sai
  da primeira parte e aponta para o nó anterior.

## Pseudocódigo

```latex
\begin{algorithm}[htbp]
  \caption{Busca binária em um vetor ordenado}
  \begin{algorithmic}[1]
    \Function{Busca}{$v, n, x$}
      \State $i \gets 1$; \ $f \gets n$
      \While{$i \le f$}
        \State $m \gets \lfloor (i + f)/2 \rfloor$
        \If{$v[m] = x$}
          \State \Return $m$
        \ElsIf{$v[m] < x$}
          \State $i \gets m + 1$
        \Else
          \State $f \gets m - 1$
        \EndIf
      \EndWhile
      \State \Return $-1$     \Comment{não encontrado}
    \EndFunction
  \end{algorithmic}
\end{algorithm}
```

- `[1]` em `algorithmic` numera todas as linhas. O `algpseudocodex` marca os blocos com linhas
  verticais de indentação e, por padrão, não imprime "fim enquanto" nem "fim se".
- As palavras-chave são trocadas com `\algrenewcommand`; o `\ElsIf` junta as duas já traduzidas e
  sai "senão se".
- O título "Algoritmo" e a lista de algoritmos vêm do pacote `algorithm`; `\floatname` traduz o
  título. A lista é gerada por `\listofalgorithms`.
- Não carregue `algorithm2e` no mesmo documento: ele define outro ambiente `algorithm` (veja a
  [receita 04](04-programacao.md)).
