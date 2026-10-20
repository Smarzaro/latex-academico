# 01 – Rótulos e referências: `\label`, `\ref` e `\pageref`

**Problema.** Citar no texto o número de uma seção, figura, tabela ou item de lista (e a página em
que ele está) sem digitar o número, que muda sempre que algo é inserido antes.

**Solução.** Marque o elemento com `\label{rótulo}` e cite-o com `\ref{rótulo}` (o número) ou
`\pageref{rótulo}` (a página).
Exemplo completo: [`rotulos.tex`](../../exemplos/referencia-cruzada/rotulos.tex).

## Itens de lista

```latex
Razões para usar o \LaTeX:
\begin{enumerate}
  \item é gratuito;\label{it:gratuito}
  \item separa o conteúdo da formatação;\label{it:conteudo}
  \item gerencia a bibliografia;
  \item usa arquivos de texto puro.\label{it:texto}
\end{enumerate}
As razões mais citadas são os itens \ref{it:gratuito} e \ref{it:conteudo}, mas o item
\ref{it:texto} também pesa muito. A lista completa está na página~\pageref{it:gratuito}.
```

O resultado é "os itens 1 e 2, mas o item 4" e "na página 1".

## Figuras e tabelas

```latex
A Figura~\ref{fig:exemplo} mostra uma imagem e a Tabela~\ref{tab:cargas} resume as cargas
horárias.

\begin{figure}[htbp]
  \centering
  \includegraphics[width=4cm]{example-image-a}
  \caption{Uma imagem de exemplo.}\label{fig:exemplo}
\end{figure}

\begin{table}[htbp]
  \centering
  \caption{Carga horária por tipo de atividade.}\label{tab:cargas}
  \begin{tabular}{lr}
    \toprule
    Atividade              & Horas \\
    \midrule
    Disciplinas            & 2.400 \\
    Estágio supervisionado &   300 \\
    Trabalho de conclusão  &   120 \\
    \bottomrule
  \end{tabular}
\end{table}
```

O `\label` vai **depois** do `\caption`: é o `\caption` que dá o número à figura ou à tabela.

## Seções

```latex
\section{Introdução}
Tudo é explicado na Seção~\ref{sec:refcruzada}. Para tabelas, consulte a
Seção~\ref{sec:tabelas}; para figuras, a Seção~\ref{sec:figuras}.

\section{Referência cruzada}\label{sec:refcruzada}
\subsection{Tabelas}\label{sec:tabelas}
\subsection{Figuras}\label{sec:figuras}
```

A referência pode vir antes do elemento citado: no resultado, a introdução cita as Seções 2, 2.1 e
2.2, definidas depois dela.

## Como funciona

Na primeira compilação, cada `\label` grava o número e a página no arquivo `.aux`; na seguinte, os
`\ref` leem esses valores. Até lá, as referências saem como **??** e o log avisa *There were
undefined references*. O `latexmk` repete a compilação até as referências se estabilizarem.

## Convenções

- **Prefixos:** `cap:` (capítulo), `sec:` (seção), `fig:`, `tab:`, `qua:` (quadro), `gra:`
  (gráfico), `eq:`, `it:` (item), `lst:` (código). O prefixo evita conflitos (`fig:resultados`
  e `tab:resultados`) e lembra o tipo ao escrever o texto. Não é regra do LaTeX, que aceita
  qualquer rótulo: é uma convenção, e cada um pode criar a sua, desde que a siga no trabalho
  inteiro.
- **Rótulos descritivos e estáveis:** `fig:arquitetura`, e não `fig:3` ou `fig:nova`, porque o
  rótulo não muda quando a figura muda de lugar.
- **Espaço inseparável:** `Figura~\ref{...}` e `página~\pageref{...}` com `~` impedem que o número
  fique sozinho no começo da linha seguinte.

## Armadilhas

- **`\label` antes do `\caption`** faz o `\ref` devolver o número da seção em que a figura está,
  e não o da figura. O erro é silencioso: confira os números no PDF.
- **Rótulo repetido:** o aviso *Label ... multiply defined* indica dois `\label` iguais; a
  referência aponta para o último.
- **Rótulo inexistente** (erro de digitação): sai **??** e o aviso
  *Reference ... undefined* mostra o nome no log.
- **Rótulos com acentos ou espaços** podem falhar com alguns pacotes: use letras sem acento,
  números, `:` e `-`.
- **Para escrever o tipo automaticamente** ("Figura", "Seção"), veja a
  [receita 02](02-autoref-cleveref.md).
