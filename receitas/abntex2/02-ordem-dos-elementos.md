# 02 – Ordem dos elementos do trabalho

**Problema.** Montar o trabalho na ordem da NBR 14724 (pré-textuais, textuais e pós-textuais),
com resumo e *abstract*, listas, sumário, apêndices e anexos.

**Solução.** A `abntex2` divide o documento com três comandos, `\pretextual`, `\textual` e
`\postextual`, que ajustam a numeração das páginas e o estilo dos títulos de cada parte. Entre
eles vão os elementos, na ordem da norma. Exemplo completo:
[`tcc-esqueleto.tex`](../../exemplos/abntex2/tcc-esqueleto.tex); o preâmbulo e os dados estão na
[receita 01](01-preambulo-e-dados.md).

## Elementos pré-textuais

```latex
\pretextual
\imprimircapa
\imprimirfolhaderosto

\begin{resumo}
Texto do resumo em português, em parágrafo único.

\textbf{Palavras-chave}: LaTeX; abnTeX2; trabalho acadêmico.
\end{resumo}

\begin{resumo}[Abstract]
\begin{otherlanguage*}{english}
Abstract text in English.

\textbf{Keywords}: LaTeX; abnTeX2; academic writing.
\end{otherlanguage*}
\end{resumo}

\listoffigures*       % o * deixa a lista fora do sumário
\cleardoublepage      % cada lista e o sumário em página própria
\listoftables*
\cleardoublepage
\tableofcontents*
\cleardoublepage
```

- O argumento opcional de `resumo` troca o título; `otherlanguage*` aplica a hifenização do
  inglês ao texto do *abstract*.
- As palavras-chave vêm depois de "Palavras-chave:", separadas por ponto e vírgula, com inicial
  minúscula (salvo nomes próprios e científicos) e terminadas por ponto (NBR 6028:2021, 4.1.7).
- A ordem da norma inclui ainda, quando existem, errata, folha de aprovação, dedicatória,
  agradecimentos, epígrafe e as listas de abreviaturas, siglas e símbolos. A folha de aprovação
  assinada e a ficha catalográfica costumam entrar como PDF, com o `\includepdf` do pacote
  `pdfpages`.

## Elementos textuais

```latex
\textual
\chapter{Introdução}\label{cap:introducao}

Os objetivos do trabalho são:
\begin{alineas}
  \item levantar os requisitos;
  \item desenvolver o protótipo;
  \item avaliar o protótipo com usuários.
\end{alineas}

Segundo \textcite{ex-livro}, a citação direta longa (mais de três linhas) fica recuada:
\begin{citacao}
Texto citado literalmente, com mais de três linhas, que a classe abntex2 formata com recuo de
4\,cm, fonte menor e espaçamento simples, como orienta a NBR 10520. A referência vem ao final
da citação, entre parênteses \cite[p.~35]{ex-livro}.
\end{citacao}
```

- `alineas` numera os itens com letras (a, b, c), como pede a NBR 6024 para as alíneas; cada uma
  termina com ponto e vírgula, e a última, com ponto.
- `citacao` é a citação direta longa da NBR 10520.
- A partir de `\textual`, as páginas passam a mostrar o número, contado desde a folha de rosto.

## Elementos pós-textuais

```latex
\postextual
\printbibliography[title=Referências]

\begin{apendicesenv}
\chapter{Questionário aplicado}
Texto do apêndice (elaborado pelo autor).
\end{apendicesenv}

\begin{anexosenv}
\chapter{Regulamento do curso}
Texto do anexo (elaborado por terceiros).
\end{anexosenv}
```

- Dentro de `apendicesenv` e `anexosenv`, cada `\chapter` vira "APÊNDICE A – Título" ou
  "ANEXO A – Título", também no sumário.
- **Apêndice** é material do próprio autor (questionário, código, dados); **anexo** é material de
  terceiros (regulamento, documento oficial).

## Ajustes comuns e armadilhas

- O `\cleardoublepage` depois de cada lista e do sumário faz cada um começar em página própria.
  Sem ele, listas curtas dividem a página com o sumário, e essa página recebe o número que o
  `\textual` passa a imprimir.
- Liste só o que existe: sem figuras, apague o `\listoffigures*`.
- Os títulos de capítulos e seções vão em `\chapter`, `\section`, `\subsection`... A `abntex2`
  cuida da numeração progressiva (NBR 6024) e da formatação.
- Cada um dos três comandos aparece uma única vez, nesta ordem: `\pretextual` logo depois do
  `\begin{document}`, `\textual` antes do primeiro capítulo e `\postextual` antes das referências.

## Lista de conferência

- [ ] Capa, folha de rosto, resumo e *abstract* com palavras-chave.
- [ ] Listas que existem no trabalho e sumário, cada um em página própria.
- [ ] `\textual` antes do primeiro capítulo; `\postextual` antes das referências.
- [ ] Apêndices (do autor) separados dos anexos (de terceiros).
