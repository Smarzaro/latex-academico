# 04 – Células mescladas e cabeçalhos agrupados

**Problema.** Um cabeçalho que agrupa várias colunas ("Tempo (ms)" sobre as colunas de mínimo,
média e máximo) ou um rótulo que vale para várias linhas ("Leitura" sobre HDD e SSD).

**Solução.** `\multicolumn` (colunas), `\multirow` (linhas, pacote `multirow`) e `\cmidrule`
(filetes parciais, do `booktabs`).
Exemplo completo: [`tabela-mesclada.tex`](../../exemplos/tabelas/tabela-mesclada.tex).

```latex
\usepackage{booktabs}
\usepackage{multirow}
```

```latex
\begin{tabular}{l l S[table-format=3.0] S[table-format=3.0] S[table-format=3.0]}
  \toprule
  & & \multicolumn{3}{c}{\textbf{Tempo (ms)}} \\
  \cmidrule(lr){3-5}
  \textbf{Operação} & \textbf{Armazenamento} & {\textbf{Mín.}} & {\textbf{Média}} & {\textbf{Máx.}} \\
  \midrule
  \multirow{2}{*}{Leitura} & Disco (HDD) &  12 &  28 &  95 \\
                           & Disco (SSD) &   2 &   5 &  21 \\
  \midrule
  \multirow{2}{*}{Escrita} & Disco (HDD) &  18 &  41 & 130 \\
                           & Disco (SSD) &   3 &   9 &  36 \\
  \bottomrule
\end{tabular}
```

- `\multicolumn{n}{c}{texto}` ocupa `n` colunas e define o alinhamento da célula.
- `\multirow{n}{*}{texto}` ocupa `n` linhas; deixe vazias, nas linhas seguintes, as células da
  mesma coluna.
- `\cmidrule(lr){a-b}` traça um filete da coluna `a` à `b`, com um pequeno recuo nas pontas
  (`lr`), separando o cabeçalho agrupado.
- Para centralizar o cabeçalho de uma coluna de texto à esquerda, use um `\multicolumn{1}{c}{...}`
  de uma só coluna.
