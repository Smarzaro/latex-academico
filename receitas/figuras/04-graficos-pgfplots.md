# 04 – Gráficos com PGFPlots

**Problema.** Produzir gráficos de barras e de linhas no próprio LaTeX, com fontes e tamanhos
coerentes com o texto, e uma lista própria de gráficos.

**Solução.** O pacote `pgfplots`, que funciona sobre o TikZ (o ambiente `axis` fica dentro de um
`tikzpicture`). A `abntex2` não define o float "Gráfico"; declare-o com o `\newfloat` do
`memoir`. Exemplo completo: [`grafico-pgfplots.tex`](../../exemplos/figuras/grafico-pgfplots.tex).

```latex
\usepackage{tikz}
\usepackage{pgfplots}
\pgfplotsset{compat=newest}
\newfloat{grafico}{lgr}{Gráfico}
\newlistof{listofgraficos}{lgr}{Lista de gráficos}   % \listofgraficos imprime a lista
```

## Gráfico de barras

```latex
\begin{grafico}[htbp]
  \caption{Tempo médio de resposta por implementação}\label{gra:barras}
  \centering
  \begin{tikzpicture}
    \begin{axis}[ybar, width=0.7\linewidth, height=5.5cm, bar width=18pt,
        symbolic x coords={A, B}, xtick=data, ymin=0, ymax=140,
        ylabel={Tempo (ms)}, nodes near coords, enlarge x limits=0.4]
      \addplot[fill=black!35] coordinates {(A,120) (B,98)};
    \end{axis}
  \end{tikzpicture}
  \fonte{Elaborado pelo próprio autor.}
  \nota{Média de 30 execuções.}
\end{grafico}
```

## Gráfico de linhas

```latex
\begin{grafico}[htbp]
  \caption{Tempo de resposta por número de usuários simultâneos}\label{gra:linhas}
  \centering
  \begin{tikzpicture}
    \begin{axis}[width=0.8\linewidth, height=6cm, xlabel={Usuários simultâneos},
        ylabel={Tempo (ms)}, grid=major, legend pos=north west]
      \addplot[mark=square*, thick] coordinates {(10,40) (50,55) (100,90) (200,180)};
      \addplot[mark=triangle*, thick, dashed] coordinates {(10,35) (50,45) (100,60) (200,95)};
      \legend{Versão 1, Versão 2}
    \end{axis}
  \end{tikzpicture}
  \fonte{Elaborado pelo próprio autor.}
\end{grafico}
```

- **Preto e branco.** Diferencie as séries por marcadores e estilos de linha (`mark=...`,
  `dashed`), e não só por cores.
- **Dados de arquivo.** `\addplot table {dados.csv};` lê os pontos de um arquivo, o que mantém o
  gráfico atualizado com os dados (use `col sep=comma` para CSV).
- **Largura.** `width=0.8\linewidth` ajusta o gráfico ao texto.
- Cite o gráfico no texto com `\autoref{gra:barras}` ("Gráfico 1").
