# 05 – Ambientes flutuantes

**Problema.** Entender por que a figura ou a tabela "não fica onde foi escrita" e controlar a
posição sem brigar com o LaTeX.

**Solução.** Os ambientes `figure` e `table` são *flutuantes*: o LaTeX os coloca no primeiro
lugar permitido em que cabem, que pode ser o topo ou a base da página, ou a página seguinte.
Indique as posições aceitáveis, cite a ilustração no texto pelo rótulo e deixe o resto com o
LaTeX.
Exemplo completo: [`ambientes-flutuantes.tex`](../../exemplos/figuras/ambientes-flutuantes.tex).

```latex
\begin{figure}[htbp] % posições permitidas: aqui, topo, base, página de floats
  \centering
  \includegraphics[width=5cm]{example-image-a}
  \caption{Legenda da figura (abaixo da imagem).}\label{fig:flutuante}
\end{figure}

\begin{table}[htbp]
  \centering
  \caption{Legenda da tabela (acima da tabela).}\label{tab:flutuante}
  \begin{tabular}{lr}
    ...
  \end{tabular}
\end{table}
```

## As posições

| Letra | Significado |
|---|---|
| `h` | *here*: aqui, no ponto do texto, se couber |
| `t` | *top*: no topo de uma página |
| `b` | *bottom*: na base de uma página |
| `p` | *page*: em uma página só de flutuantes |
| `!` | relaxa os limites de quantos flutuantes cabem numa página e de quanto espaço eles ocupam |

A ordem das letras não muda a preferência: o LaTeX sempre tenta, nessa sequência, aqui, topo,
base e página própria, entre as que você permitiu. `[htbp]` deixa todas abertas e é o melhor
ponto de partida.

## Ajustes mais comuns

- **Cite pelo rótulo.** Escreva "a Figura~\ref{fig:flutuante}" ou `\autoref{fig:flutuante}`,
  nunca "a figura abaixo": depois de flutuar, ela pode estar acima ou na página seguinte.
- **`\label` depois do `\caption`.** O rótulo guarda o último número gerado; antes do
  `\caption`, ele pega o número da seção. Veja a
  [receita 01 de referência cruzada](../referencia-cruzada/01-label-ref-pageref.md).
- **Legenda.** Na ABNT, o título de figuras e tabelas fica *acima*, com a fonte abaixo (veja a
  [receita 02 de tabelas](../tabelas/02-titulo-fonte-legenda-nota.md)). O exemplo mostra a
  convenção do `article`, com a legenda da figura abaixo, para comparar.
- **Os flutuantes foram todos para o fim do capítulo.** Um flutuante que não cabe em lugar nenhum
  segura todos os seguintes do mesmo tipo, que só saem juntos no `\clearpage` ou no fim do
  documento. Permita mais posições (`[htbp]`), reduza a ilustração ou divida-a em duas.
- **Não deixar passar de uma seção.** `\usepackage[section]{placeins}` impede que um flutuante
  atravesse o início da seção seguinte; `\FloatBarrier` faz o mesmo em um ponto qualquer.
- **`[H]` (pacote `float`).** Prende a ilustração no lugar exato, como se não fosse flutuante, e
  costuma deixar buracos no fim das páginas. Use só quando a posição for realmente obrigatória.
- **Ilustração sem flutuar.** Fora de `figure`, `\captionof{figure}{...}` (pacote `caption`)
  numera uma imagem posta dentro de um `minipage`, sem deixá-la mudar de lugar.

> **Experimente.** No exemplo, troque `[htbp]` por `[t]` na figura e por `[b]` na tabela e
> compare os resultados: o texto continua no mesmo lugar, e as ilustrações mudam de posição.
