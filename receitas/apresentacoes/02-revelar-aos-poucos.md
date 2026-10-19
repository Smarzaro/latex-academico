# 02 – Revelar o conteúdo aos poucos

**Problema.** Mostrar os tópicos de um slide um de cada vez, ou fazer um elemento aparecer (ou
sumir) em um momento da explicação.

**Solução.** As sobreposições (*overlays*) do `beamer`: cada passo de um frame vira uma página do
PDF, e o leitor de PDF, ao avançar a página, dá a impressão de que o conteúdo surge na tela.
Exemplo completo: [`sobreposicoes.tex`](../../exemplos/apresentacoes/sobreposicoes.tex).

## `\pause`: o mais simples

```latex
\begin{frame}{Comando pause}
  Os tópicos aparecem um de cada vez.
  \begin{itemize}
    \pause \item Primeiro tópico
    \pause \item Segundo tópico
  \end{itemize}
\end{frame}
```

Tudo o que vem depois de um `\pause` só aparece no passo seguinte. Este frame tem três passos
(três páginas): só a frase; a frase e o primeiro tópico; tudo.

## Especificadores: quando cada elemento aparece

```latex
\begin{frame}{Especificadores de sobreposição}
  \begin{itemize}
    \item<1>  Aparece só no primeiro passo
    \item<2-3> Aparece no segundo e no terceiro
    \item<3-> Aparece a partir do terceiro e continua
  \end{itemize}
  \begin{block}<4->{Bloco}
    O bloco só aparece no quarto passo.
  \end{block}
\end{frame}
```

O especificador entre `< >` diz em quais passos o elemento aparece: `<2>` (só no 2), `<2-3>`
(do 2 ao 3), `<3->` (do 3 em diante). O número de passos do frame é o maior número usado: aqui,
quatro.

## Listas incrementais, `\uncover` e `\only`

```latex
\begin{frame}{Lista incremental}
  \begin{itemize}[<+->]          % equivale a <+-> em cada \item
    \item Primeiro tópico
    \item Segundo tópico
    \item Terceiro tópico
  \end{itemize}
  \uncover<3->{Visível (e com espaço reservado) a partir do terceiro passo.}
  \only<2>{Só no segundo passo, sem reservar espaço nos outros.}
\end{frame}
```

- `[<+->]` na lista revela um item por passo, sem numerar cada um à mão.
- `\uncover` esconde o conteúdo, mas reserva o espaço dele: nada se mexe quando ele aparece.
- `\only` não reserva espaço: o que vem depois se desloca quando ele aparece ou some. Serve para
  trocar um conteúdo por outro no mesmo lugar.

## Ajustes comuns e armadilhas

- O PDF da apresentação tem mais páginas que frames: o exemplo tem 3 frames e 10 páginas. Para
  imprimir ou distribuir, gere a versão `handout`, com uma página por frame (veja a
  [receita 05](05-curso-com-subfiles.md)).
- Use as sobreposições com moderação: revelar cada tópico ajuda a conduzir a fala, mas um slide
  com muitos passos cansa.
- Com `\only`, o conteúdo do slide pode "pular" de lugar entre os passos; se isso incomodar, use
  `\uncover` ou `\onslide`.
- O número da página no rodapé conta frames, não passos: todas as páginas de um mesmo frame
  mostram o mesmo número.
