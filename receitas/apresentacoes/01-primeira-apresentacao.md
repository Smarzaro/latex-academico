# 01 – Primeira apresentação com beamer

**Problema.** Fazer uma apresentação simples: slide de título, slides com tópicos e um destaque.

**Solução.** A classe `beamer`, um tema pronto (`\usetheme`) e um ambiente `frame` por slide.
Exemplo completo: [`apresentacao-basica.tex`](../../exemplos/apresentacoes/apresentacao-basica.tex).

```latex
\documentclass[aspectratio=169]{beamer}   % 16:9; sem a opção, 4:3
\usepackage[T1]{fontenc}
\usepackage[brazilian]{babel}
\usetheme{Madrid}                         % troque por CambridgeUS, Rochester, default...

\title{Apresentação com beamer}
\author{Nome do Autor}
\institute{Nome da Instituição}
\date{\today}
```

```latex
\begin{frame}
  \titlepage
\end{frame}

\begin{frame}{Primeiro slide}   % o título do frame vai entre chaves
  \begin{itemize}
    \item Primeiro tópico
    \item Segundo tópico
  \end{itemize}

  \begin{block}{Título do bloco}
    Conteúdo destacado em um bloco.
  \end{block}
\end{frame}
```

O resultado tem duas páginas: o slide de título, montado por `\titlepage` com os dados do
preâmbulo, e o slide com a lista e o bloco. No tema `Madrid`, o nome do autor, o título, a data e
o número do slide aparecem no rodapé de cada slide.

## Ajustes comuns

- **Tema**: `\usetheme{...}` define a disposição (faixas, rodapé, navegação); `\usecolortheme{...}`
  troca só as cores. Teste alguns temas antes de personalizar um.
- **Blocos**: além de `block`, há `exampleblock` e `alertblock`, com cores diferentes (veja a
  [receita 06](06-identidade-visual.md)).
- **Título curto**: `\title[Curto]{Título longo}` e `\author[Sobrenome]{Nome completo}` põem a
  versão curta no rodapé.
- **Seções**: `\section{...}` entre os frames organiza a apresentação, e `\tableofcontents`
  dentro de um frame faz o roteiro (veja a [receita 03](03-modelo-de-defesa.md)).

## Armadilhas

- Texto fora de um `frame` (entre um `\end{frame}` e o próximo `\begin{frame}`) não aparece.
- Conteúdo demais em um frame não passa para o slide seguinte: ele é cortado na borda inferior.
  Divida o conteúdo em dois frames.
- Os símbolos de navegação no canto inferior direito raramente são usados;
  `\setbeamertemplate{navigation symbols}{}` os remove.
