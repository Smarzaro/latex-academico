# 02 – Subfiguras

**Problema.** Uma figura composta por duas ou mais imagens, cada uma com sua legenda "(a)", "(b)",
e citável separadamente.

**Solução.** Com a classe `abntex2` (que é baseada no `memoir`), use o `\subbottom` do próprio
`memoir`. **Não** carregue `subfig` nem `subcaption`: são incompatíveis com o `memoir`.
Exemplo completo: [`figura-subfiguras.tex`](../../exemplos/figuras/figura-subfiguras.tex).

```latex
\usepackage{graphicx}
\newsubfloat{figure}                  % habilita \subbottom dentro de figure (memoir)
```

```latex
\begin{figure}[htbp]
  \caption{Figura com duas subfiguras}\label{fig:sub}
  \centering
  \subbottom[Primeira imagem\label{fig:sub-a}]{\includegraphics[width=.45\linewidth]{example-image-a}}
  \hfill
  \subbottom[Segunda imagem\label{fig:sub-b}]{\includegraphics[width=.45\linewidth]{example-image-b}}
  \fonte{Elaborado pelo próprio autor.}
\end{figure}
```

- Sem `\newsubfloat{figure}`, o LaTeX acusa `No counter 'subfigure' defined`.
- `\subbottom[legenda]{conteúdo}` põe a legenda abaixo; `\subtop` a põe acima.
- Cite a figura toda com `\autoref{fig:sub}` ("Figura 1") e uma parte com `\ref{fig:sub-a}`
  ("1(a)"). O `\autoref` de uma subfigura escreve "Subfigura 1(a)"; para "Figura 1(a)", escreva
  `Figura~\ref{fig:sub-a}`.
- Dê `width` menor que `.5\linewidth` para duas imagens lado a lado (aqui, `.45`).
