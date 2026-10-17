# 03 – Diagramas com TikZ

**Problema.** Desenhar um fluxo, um esquema ou uma arquitetura simples dentro do documento, com
fonte e tamanhos coerentes com o texto e sem depender de editor gráfico.

**Solução.** O pacote `tikz`. Diagramas simples ficam bem em poucas linhas: estilos para os nós
(`etapa`) e para as setas (`seta`) mantêm o desenho consistente. Exemplo completo:
[`figura-tikz.tex`](../../exemplos/figuras/figura-tikz.tex).

```latex
\usepackage{tikz}
\usetikzlibrary{arrows.meta, positioning}
```

```latex
\begin{figure}[htbp]
  \caption{Etapas da metodologia}\label{fig:etapas}
  \centering
  \begin{tikzpicture}[node distance=7mm, font=\small,
      etapa/.style={draw, rounded corners=2pt, minimum height=9mm, minimum width=24mm,
                    align=center, fill=black!5},
      seta/.style={-{Stealth[length=2.2mm]}, thick}]
    \node[etapa] (a) {Levantamento\\de requisitos};
    \node[etapa, right=of a] (b) {Modelagem};
    \node[etapa, right=of b] (c) {Implementação};
    \node[etapa, right=of c] (d) {Avaliação};
    \draw[seta] (a) -- (b);
    \draw[seta] (b) -- (c);
    \draw[seta] (c) -- (d);
  \end{tikzpicture}
  \fonte{Elaborado pelo próprio autor.}
\end{figure}
```

- `right=of a` (biblioteca `positioning`) posiciona um nó à direita de outro, com a distância de
  `node distance`.
- `font=\small` e cores em tons de cinza (`black!5`) mantêm o desenho legível em preto e branco.
- Um diagrama que ocupa a largura do texto pode usar `\linewidth` para calcular as medidas (veja o
  [diagrama de Gantt](../cronograma/02-diagrama-de-gantt.md)).
- Para diagramas grandes (UML, redes), considere ferramentas especializadas (PlantUML, draw.io)
  e inclua o resultado em PDF com `\includegraphics`.
