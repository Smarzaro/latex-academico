# 04 – Pôster acadêmico

**Problema.** Fazer o pôster de um evento (iniciação científica, congresso) em tamanho A0, com
título, autores e o conteúdo distribuído em colunas e blocos.

**Solução.** A classe `tikzposter`, que monta a página inteira com blocos de título e conteúdo.
Exemplo completo: [`poster.tex`](../../exemplos/apresentacoes/poster.tex) (a imagem
`example-image` vem do pacote `mwe`).

```latex
\documentclass[25pt, a0paper, portrait]{tikzposter}
\usepackage[T1]{fontenc}
\usepackage[brazilian]{babel}
\usetheme{Simple}

\title{Título do trabalho apresentado em pôster}
\author{Nome do Autor, Nome do Orientador}
\institute{Nome da Instituição}

\begin{document}
\maketitle

\begin{columns}
  \column{0.5}
  \block{Introdução}{Contexto, problema e objetivos do trabalho, em poucas linhas.}
  \block{Metodologia}{Etapas do trabalho e materiais utilizados.}

  \column{0.5}
  \block{Resultados}{
    \begin{tikzfigure}[Legenda da figura]
      \includegraphics[width=.8\linewidth]{example-image}
    \end{tikzfigure}
  }
  \block{Conclusões}{Principais conclusões e trabalhos futuros.}
\end{columns}
\end{document}
```

- `25pt, a0paper, portrait`: tamanho da letra do texto, papel e orientação. Para pôster
  horizontal, `landscape`; para papel menor, `a1paper`.
- `\maketitle` monta a faixa do título com `\title`, `\author` e `\institute`.
- `\column{0.5}` abre uma coluna com metade da largura; os blocos seguintes vão para ela, um
  abaixo do outro, até o próximo `\column`.
- `\block{Título}{Conteúdo}`: cada seção do pôster.
- Figuras usam `tikzfigure` (e não `figure`), com a legenda no argumento opcional.

## Ajustes comuns

- **Tema**: `\usetheme{...}` troca o visual inteiro (`Default`, `Simple`, `Rays`, `Basic`,
  `Envelope`, `Wave`, `Board`, `Autumn`, `Desert`); há também temas só de cores, com
  `\usecolorstyle{...}`.
- **Colunas desiguais**: as frações somam 1 (por exemplo, `\column{0.4}` e `\column{0.6}`).
- **Logotipos**: `\titlegraphic{...}` acrescenta imagens à faixa do título.
- **Regras do evento**: confira tamanho, orientação e elementos obrigatórios (logotipos,
  agradecimento a agências de fomento) no edital antes de começar.

## Armadilhas

- A classe põe uma pequena nota "LaTeX TikZposter" no canto inferior direito;
  `\tikzposterlatexaffectionproofoff` no preâmbulo a remove.
- No exemplo, a legenda da figura sai com o prefixo "Fig. 1:", da própria classe; confira se o
  evento pede outra forma.
- Texto demais em um bloco não quebra para outra coluna: o bloco cresce e pode passar da borda
  da página. Pôster se lê de longe; corte o texto.
- `figure` e `table` não funcionam dentro dos blocos; use `tikzfigure` e, para tabelas, um
  `tabular` direto no conteúdo do bloco.
