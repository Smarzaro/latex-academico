# 03 – Glossário

**Problema.** Um elemento pós-textual opcional, com os termos técnicos do trabalho e suas
definições, em ordem alfabética.

**Solução.** Para glossários curtos, basta um ambiente simples: o título "GLOSSÁRIO" (que entra no
sumário) e um parágrafo por termo, com o termo em negrito, em espaço simples. Exemplo completo:
[`glossario-manual.tex`](../../exemplos/siglas/glossario-manual.tex).

```latex
\newcommand{\termo}[2]{\par\noindent\textbf{#1:} #2\par\medskip}
\newenvironment{glossario}{%
  \pretextualchapter{\MakeUppercase{Glossário}}%
  \addcontentsline{toc}{chapter}{\MakeUppercase{Glossário}}%
  \begingroup\SingleSpacing}{\endgroup}
```

```latex
\postextual
\begin{glossario}
  \termo{API}{Conjunto de definições e protocolos que permite a comunicação entre sistemas.}
  \termo{Framework}{Estrutura reutilizável de software que oferece funcionalidades genéricas.}
  \termo{SGBD}{Sistema que gerencia a criação, o acesso e a manutenção de bancos de dados.}
\end{glossario}
```

- Mantenha os termos em **ordem alfabética**.
- O glossário explica **termos**; as siglas ficam na lista de siglas ([receita 01](01-siglas-com-acro.md)).
- Para glossários grandes, com remissões entre termos, ordenação automática e vários idiomas,
  considere o pacote `glossaries-extra` (exige rodar o `bib2gls` ou o `makeglossaries`).
