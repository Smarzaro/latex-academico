# 01 – Cronograma em quadro: marcas e células sombreadas

**Problema.** Apresentar as atividades e os meses de execução em um quadro legível, que ocupe a
largura do texto e funcione em preto e branco.

**Solução.** `tabularx` com uma coluna `X` elástica por mês (a primeira coluna, `l`, não quebra
linha) e, no sombreado, `colortbl` (carregado por `xcolor` com a opção `table`). Pressupõe o float
`quadro` (veja a [receita 06 de tabelas](../tabelas/06-quadro.md)).

## Opção A: marcas

Exemplo completo: [`cronograma-marcas.tex`](../../exemplos/cronograma/cronograma-marcas.tex).

```latex
\begin{quadro}[htbp]
  \caption{Cronograma do projeto em meses}\label{qua:cronograma}
  \small
  \begin{tabularx}{\linewidth}{|l|*{12}{>{\centering\arraybackslash}X|}}
    \hline
    \textbf{Atividade} & \textbf{1} & \textbf{2} & \textbf{3} & \textbf{4} & \textbf{5} & \textbf{6} & \textbf{7} & \textbf{8} & \textbf{9} & \textbf{10} & \textbf{11} & \textbf{12} \\
    \hline
    Revisão bibliográfica & $\bullet$ & $\bullet$ & & & & & & & & & & \\
    \hline
    Métodos & & & $\bullet$ & $\bullet$ & & & & & & & & \\
    \hline
    % ... demais atividades ...
  \end{tabularx}
  \fonte{Elaborado pelo próprio autor.}
  \nota{O símbolo $\bullet$ indica o mês em que a atividade é executada.}
\end{quadro}
```

## Opção B: células sombreadas

Exemplo completo: [`cronograma-sombreado.tex`](../../exemplos/cronograma/cronograma-sombreado.tex).
O cabeçalho "Mês" agrupa as doze colunas (`\multicolumn`), e `\renewcommand{\arraystretch}{1.5}`
dá linhas mais altas, que melhoram a leitura.

```latex
\usepackage[table]{xcolor}            % cores como black!35 e \cellcolor (carrega o colortbl)
\usepackage{multirow}
```

```latex
\newcommand{\mes}{\cellcolor{black!35}}   % célula sombreada

\begin{quadro}[htbp]
  \caption{Cronograma do projeto com células sombreadas}\label{qua:cronograma-cor}
  \small
  \renewcommand{\arraystretch}{1.5}
  \begin{tabularx}{\linewidth}{|l|*{12}{>{\centering\arraybackslash}X|}}
    \hline
    \multirow{2}{*}{\textbf{Atividade}} & \multicolumn{12}{c|}{\textbf{Mês}} \\
    \cline{2-13}
     & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 & 11 & 12 \\
    \hline
    Revisão bibliográfica & \mes & \mes & & & & & & & & & & \\
    \hline
    % ... demais atividades ...
  \end{tabularx}
  \fonte{Elaborado pelo próprio autor.}
  \nota{As células sombreadas indicam os meses de execução de cada atividade.}
\end{quadro}
```

- Para outro período (por exemplo, 6 meses), troque `*{12}` pelo número de colunas e ajuste o
  `\multicolumn{12}` e o `\cline`.
- O sombreado (`black!35`) mantém a legibilidade em escala de cinza; evite cores claras demais.
