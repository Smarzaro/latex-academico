# 03 – Modelo para defesa ou seminário

**Problema.** Um ponto de partida para a defesa do TCC (ou um seminário): visual limpo, roteiro,
texto ao lado de uma figura, citações no padrão ABNT e a lista de referências.

**Solução.** O tema `metropolis`, o `biblatex` com o estilo `abnt` e o ambiente `columns`.
Exemplo completo: [`modelo-apresentacao.tex`](../../exemplos/apresentacoes/modelo-apresentacao.tex)
(a imagem `example-image` vem do pacote `mwe`).

## Preâmbulo

```latex
\documentclass[aspectratio=169]{beamer}
\usepackage[T1]{fontenc}
\usepackage[brazilian]{babel}
\usetheme[progressbar=frametitle]{metropolis}
\setbeamertemplate{frametitle continuation}{}   % sem "I", "II" nos slides divididos
\usepackage{booktabs}
\usepackage{csquotes}
\usepackage[backend=biber, style=abnt]{biblatex}
\addbibresource{../referencias/catalogo.bib}

\title{Título do trabalho}
\subtitle{Defesa de Trabalho de Conclusão de Curso}
\author{Nome do Autor \\ \small Orientador: Prof. Dr. Fulano de Tal}
\institute{Nome da Instituição}
\date{\today}
% \titlegraphic{\hfill\includegraphics[height=1cm]{logo}}
```

- `progressbar=frametitle` desenha, sob o título de cada slide, uma barra que mostra quanto da
  apresentação já passou.
- O orientador entra no `\author`, depois de `\\`, em letra menor.
- `\titlegraphic` põe o logotipo da instituição no slide de título (descomente e troque `logo`
  pelo nome do arquivo).

## Texto ao lado de uma figura

```latex
\begin{frame}{Problema e objetivos}
  \begin{columns}[T]
    \begin{column}{.55\textwidth}
      \begin{itemize}
        \item Contexto do problema \parencite{ex-livro}
        \item Objetivo geral
        \item Objetivos específicos
      \end{itemize}
    \end{column}
    \begin{column}{.4\textwidth}
      \includegraphics[width=\linewidth]{example-image}
    \end{column}
  \end{columns}
\end{frame}
```

`[T]` alinha as colunas pelo topo. As larguras somam menos que `\textwidth` para deixar um
espaço entre elas; dentro de cada coluna, `\linewidth` é a largura da coluna.

## Referências

```latex
\begin{frame}[allowframebreaks]{Referências}
  \printbibliography[heading=none]
\end{frame}
```

- `allowframebreaks` divide a lista em quantos slides forem precisos; o
  `\setbeamertemplate{frametitle continuation}{}` do preâmbulo tira os numerais romanos ("I",
  "II") que o `beamer` acrescenta ao título dos slides divididos.
- `heading=none` evita um segundo título, já que o frame tem o seu.

O exemplo tem ainda um slide de roteiro (`\tableofcontents` dentro de um frame), um slide de
seção gerado pelo tema a cada `\section`, uma tabela com `booktabs` e o slide final com
`\begin{frame}[standout]`, que o `metropolis` mostra com fundo escuro e texto centralizado.

## Ajustes comuns e armadilhas

- Compile com `latexmk`, que roda o `biber`; sem ele, as citações saem em negrito, com a chave.
- O `metropolis` usa a fonte Fira quando compilado com XeLaTeX ou LuaLaTeX e a fonte instalada;
  com pdfLaTeX, usa a fonte sem serifa padrão. As duas formas funcionam.
- Na lista de referências, o `beamer` põe um pequeno ícone antes de cada entrada e muda a cor de
  partes dela; `\setbeamertemplate{bibliography item}{}` tira o ícone.
- Slides de defesa não precisam repetir o texto do trabalho: tópicos curtos, figuras e tabelas
  enxutas.
