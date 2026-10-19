# 03 – Divisões do documento

**Problema.** Dividir o texto em capítulos, seções e subseções numerados, que entram no sumário
automaticamente.

**Solução.** Use os comandos de divisão em ordem hierárquica; a classe cuida da numeração, da
formatação dos títulos e do sumário (`\tableofcontents`).
Exemplo completo: [`divisoes.tex`](../../exemplos/basico/divisoes.tex).

```latex
\documentclass[a4paper]{report}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage[brazilian]{babel}

\begin{document}
\chapter{Título do capítulo}
\section{Uma seção}
\subsection{Uma subseção}
\subsubsection{Uma subsubseção}
\paragraph{Um parágrafo destacado} Texto do parágrafo\ldots
\subparagraph{Um subparágrafo} Texto do subparágrafo\ldots
\end{document}
```

| Nível | Comando | Disponível em |
|---|---|---|
| −1 | `\part` | todas as classes padrão |
| 0 | `\chapter` | `report` e `book` (não existe em `article`) |
| 1 | `\section` | todas |
| 2 | `\subsection` | todas |
| 3 | `\subsubsection` | todas |
| 4 | `\paragraph` | todas (título na mesma linha do texto) |
| 5 | `\subparagraph` | todas (título na mesma linha, com recuo) |

No resultado do exemplo, capítulo, seção e subseção são numerados (1, 1.1, 1.1.1); a
subsubseção não, porque na classe `report` a numeração vai até o nível 2.

## Ajustes comuns

- **Numerar mais níveis:** `\setcounter{secnumdepth}{3}` no preâmbulo numera também as
  subsubseções. `\setcounter{tocdepth}{3}` faz o mesmo para o sumário.
- **Título sem número:** a versão com asterisco (`\section*{Agradecimentos}`) não é numerada e
  não entra no sumário. Para incluí-la, acrescente
  `\addcontentsline{toc}{section}{Agradecimentos}` logo depois.
- **Título longo no sumário:** o argumento opcional dá uma forma curta para o sumário e o
  cabeçalho: `\section[Forma curta]{Forma longa do título}`.
- **Referência a uma seção:** coloque `\label{sec:...}` logo depois do título (veja as receitas de
  [referência cruzada](../referencia-cruzada/)).

## Armadilhas

- **`\chapter` em `article`** dá o erro *Undefined control sequence*: troque a classe ou use
  `\section`.
- **Não pule níveis** (de `\section` direto para `\subsubsection`): a numeração fica com zeros
  (1.0.1) e a hierarquia perde o sentido.
- **Não formate títulos à mão** (`\textbf{1.2 Título}`): o texto não entra no sumário nem pode ser
  referenciado. Mude a aparência dos títulos na configuração da classe.
- **O sumário precisa de duas compilações:** na primeira o LaTeX grava os títulos no arquivo
  `.toc`; na segunda, os imprime. O `latexmk` faz as passagens necessárias.
