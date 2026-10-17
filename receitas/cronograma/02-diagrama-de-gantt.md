# 02 – Diagrama de Gantt

**Problema.** Mostrar o cronograma como barras ao longo do tempo, deixando evidentes as
sobreposições entre atividades, com os nomes das atividades **dentro** da moldura e a largura do
texto.

**Solução.** Um diagrama em **TikZ puro**, em uma grade única: uma primeira coluna com os nomes,
doze colunas de meses e uma barra por atividade. A largura de cada mês é calculada a partir de
`\linewidth`. Exemplo completo:
[`cronograma-gantt.tex`](../../exemplos/cronograma/cronograma-gantt.tex).

```latex
\usepackage{tikz}
```

```latex
\begin{figure}[htbp]
  \caption{Diagrama de Gantt do cronograma do projeto}\label{fig:gantt}
  \centering
  \begin{tikzpicture}[font=\footnotesize, line width=0.4pt]
    \def\gntn{6}                                       % número de atividades
    \pgfmathsetlengthmacro{\gntlc}{3.6cm}              % largura da coluna de atividades
    \pgfmathsetlengthmacro{\gntxu}{(\linewidth-\gntlc)/12} % largura de cada mês
    \pgfmathsetlengthmacro{\gnthh}{1.1cm}              % altura do cabeçalho (2 linhas)
    \pgfmathsetlengthmacro{\gntrh}{0.62cm}             % altura de cada atividade
    \pgfmathsetlengthmacro{\gntht}{\gnthh+\gntn*\gntrh} % altura total
    % ... cabeçalho, moldura e linhas ...
    % atividades: nome/mês inicial/mês final
    \foreach \nome/\ini/\fim [count=\k] in {Revisão bibliográfica/1/2, Métodos/3/4,
        Testes/4/6, Resultados/7/8, Conclusão/7/9, Banca/10/12} {
      % ... uma linha, o nome e a barra de cada atividade ...
    }
  \end{tikzpicture}
  \fonte{Elaborado pelo próprio autor.}
  \nota{Cada barra indica a duração da atividade, em meses.}
\end{figure}
```

O código completo (cabeçalho, moldura, linhas pontilhadas e barras) está no arquivo do exemplo.

## Como adaptar

- **Atividades.** Edite a lista do `\foreach`, no formato `nome/mês inicial/mês final`, e ajuste
  `\gntn` (número de atividades).
- **Período.** O exemplo tem 12 meses; para outro número, troque o `12` do cálculo de `\gntxu` e os
  limites do `\foreach \m`.
- **Largura da coluna de nomes.** `\gntlc`, em centímetros.
- **Preto e branco.** As barras são cinza (`black!55`) e o cabeçalho tem fundo cinza claro: o
  diagrama continua legível em impressão sem cores.

> **Por que não o `pgfgantt`?** O `pgfgantt` desenha bem, mas deixa os nomes das atividades fora
> da moldura da grade, e alinhar a coluna de nomes e o cabeçalho com ele exige mais ajustes do que
> o TikZ puro, que dá controle total e uma largura igual à do texto.
