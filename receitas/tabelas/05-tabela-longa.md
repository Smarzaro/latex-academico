# 05 – Tabela longa (mais de uma página)

**Problema.** Uma tabela que não cabe em uma página precisa repetir o cabeçalho em cada página e
indicar a continuação ("Continua", "Continuação" e "Conclusão", conforme a posição), como pedem
as normas de apresentação tabular.

**Solução.** O ambiente `longtable`. Use-o apenas quando a tabela realmente não couber em uma
página; tabelas longas e de consulta costumam ficar melhor em apêndice.
Exemplo completo: [`tabela-longa.tex`](../../exemplos/tabelas/tabela-longa.tex).

```latex
\usepackage{longtable}
\usepackage{booktabs}
```

O `longtable` **não é um float** e não cabe dentro de `table`, por isso o título e o rodapé são
tratados à parte:

- **Título.** É o `\caption` da primeira linha da tabela. Para que fique à esquerda e use a
  largura do texto, coloque o `longtable` dentro de um grupo com
  `\captionstyle[\raggedright]{\raggedright}` (comando do `memoir`, base da classe `abntex2`) e
  `\setlength{\LTcapwidth}{\linewidth}`. Sem isso, o título é limitado a 4 polegadas.
- **Rodapé.** Para que a fonte e as notas fiquem alinhadas com a tabela, faça a tabela ocupar a
  largura do texto: `\setlength{\LTleft}{0pt}`, `\setlength{\LTright}{0pt}` e, na especificação
  das colunas, `@{\extracolsep{\fill}}` antes da primeira coluna. O rodapé vem logo após o
  `\end{longtable}`, em espaço simples e à esquerda; `\nopagebreak` evita que ele fique sozinho
  em outra página.

```latex
{\captionstyle[\raggedright]{\raggedright}\setlength{\LTcapwidth}{\linewidth}
\small\setlength{\LTleft}{0pt}\setlength{\LTright}{0pt}
\begin{longtable}{@{\extracolsep{\fill}} l S[table-format=5.0] S[table-format=3.1]}
  \caption{Cobertura de testes por módulo do sistema}\label{tab:longa}\\
  \toprule
  \textbf{Módulo} & {\textbf{Linhas de código}} & {\textbf{Cobertura (\%)}} \\
  \midrule
  \endfirsthead
  \multicolumn{3}{@{}l}{\emph{Tabela \thetable\ -- continuação}}\\
  \toprule
  \textbf{Módulo} & {\textbf{Linhas de código}} & {\textbf{Cobertura (\%)}} \\
  \midrule
  \endhead
  \midrule
  \multicolumn{3}{r@{}}{\emph{Continua}}\\
  \endfoot
  \bottomrule
  \endlastfoot
  % ... linhas da tabela ...
\end{longtable}
}
\nopagebreak
\fonte{Elaborado pelo próprio autor.}
```

- `\endfirsthead`: cabeçalho da primeira página; `\endhead`: cabeçalho das demais (com
  "continuação"); `\endfoot`: rodapé de cada página ("Continua"); `\endlastfoot`: rodapé da
  última página.
- O exemplo completo tem 60 linhas para mostrar a quebra de página e a repetição do cabeçalho.
