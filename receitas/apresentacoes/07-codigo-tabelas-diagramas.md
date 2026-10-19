# 07 – Código, tabelas e diagramas nos slides

**Problema.** Mostrar código com partes destacadas, tabelas fáceis de ler na tela e um diagrama
que aparece no momento certo da explicação.

**Solução.** `listings` com `escapeinside` (para escrever LaTeX dentro do código) em um frame
`[fragile]`; `\rowcolors` para linhas alternadas; colunas com uma lista incremental e um diagrama
TikZ revelado com `\onslide`. Exemplos:
[`curso.tex`](../../exemplos/apresentacoes/curso/curso.tex) (preâmbulo) e
[`aula-02.tex`](../../exemplos/apresentacoes/curso/aulas/aula-02.tex) (slides).

## Código com destaques

No preâmbulo, o estilo das listagens nas cores do curso:

```latex
\lstset{basicstyle=\ttfamily\small, keywordstyle=\bfseries\color{primaria},
        commentstyle=\itshape\color{gray}, columns=fullflexible,
        escapeinside={(*}{*)},                 % LaTeX dentro do código: (* ... *)
        literate={á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
                 {ã}{{\~a}}1 {õ}{{\~o}}1 {â}{{\^a}}1 {ê}{{\^e}}1 {ô}{{\^o}}1 {ç}{{\c c}}1}
```

No slide:

```latex
\begin{frame}[fragile]{Um documento mínimo}
\begin{lstlisting}[language={[LaTeX]TeX}]
\documentclass{article}         (*\alert{\% classe}*)
\usepackage[brazilian]{babel}   (*\alert{\% preâmbulo}*)
\begin{document}
Olá, mundo!                     (*\alert{\% corpo}*)
\end{document}
\end{lstlisting}
  O \texttt{[fragile]} é obrigatório em slides com código.
\end{frame}
```

- O que fica entre `(*` e `*)` é LaTeX: aqui, `\alert` pinta de vermelho os comentários que
  explicam cada parte. Escolha delimitadores que não apareçam no código mostrado.
- `literate` troca as letras acentuadas por comandos do LaTeX; sem isso, o `listings` com
  pdfLaTeX não as imprime corretamente. As [receitas de código-fonte](../codigo/) explicam as
  demais opções.
- `columns=fullflexible` usa o espaçamento natural da fonte; para alinhar colunas de código,
  troque por `columns=fixed`.

## Tabela com linhas alternadas

```latex
\begin{frame}{Tamanhos de fonte}
  \centering
  \rowcolors{2}{primaria!8}{white}     % linhas alternadas, a partir da segunda
  \begin{tabular}{ll}
    \toprule
    \textbf{Comando} & \textbf{Uso} \\
    \midrule
    \texttt{\textbackslash small}  & notas e legendas \\
    \texttt{\textbackslash normalsize} & texto \\
    \texttt{\textbackslash large}  & títulos curtos \\
    \texttt{\textbackslash Large}  & destaques \\
    \bottomrule
  \end{tabular}
\end{frame}
```

`\rowcolors` exige a opção `xcolor=table` na classe (`\documentclass[aspectratio=169,
xcolor=table]{beamer}`), porque o `beamer` carrega o `xcolor` antes do preâmbulo. O `{2}` deixa
o cabeçalho (linha 1) sem cor; a partir da linha 2, a primeira cor vale para as linhas ímpares e
a segunda para as pares, de modo que a primeira linha sombreada é a do `\normalsize` (linha 3).

## Diagrama revelado em passos

```latex
\tikzset{etapa/.style={draw=primaria, fill=primaria!10, rounded corners,
                       minimum width=2.6cm, minimum height=.8cm}}
\begin{frame}{Do texto ao PDF}
  \begin{columns}
    \begin{column}{.5\textwidth}
      \begin{itemize}[<+->]
        \item O autor escreve o arquivo \texttt{.tex}
        \item O motor (pdf\LaTeX) compõe as páginas
        \item O resultado é um PDF
      \end{itemize}
    \end{column}
    \begin{column}{.45\textwidth}
      \onslide<4->{%
      \begin{tikzpicture}[node distance=6mm]
        \node[etapa] (tex) {arquivo .tex};
        \node[etapa, below=of tex] (motor) {pdf\LaTeX};
        \node[etapa, below=of motor] (pdf) {arquivo .pdf};
        \draw[->, thick] (tex) -- (motor);
        \draw[->, thick] (motor) -- (pdf);
      \end{tikzpicture}}
    \end{column}
  \end{columns}
\end{frame}
```

Os três itens aparecem nos passos 1, 2 e 3; o diagrama, no passo 4, que resume a sequência.
Como `\onslide` reserva o espaço, a lista não se desloca quando o diagrama surge. O preâmbulo
carrega o `tikz` e a biblioteca `positioning` (para o `below=of`); o estilo `etapa` usa as cores
do curso (veja a [receita 06](06-identidade-visual.md)).

## Armadilhas

- Sem `[fragile]`, um frame com `lstlisting` (ou `verbatim`) dá erro. Deixe o `\end{frame}` de um
  frame `fragile` sozinho na linha.
- Código em slide precisa de letra grande: no máximo 10 a 12 linhas por slide. Para trechos
  maiores, mostre só a parte que importa.
- Na versão `handout` (veja a [receita 05](05-curso-com-subfiles.md)), o frame do diagrama sai em
  uma única página, com a lista e o diagrama visíveis.
