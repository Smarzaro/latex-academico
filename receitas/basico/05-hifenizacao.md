# 05 – Hifenização de palavras desconhecidas

**Problema.** Em colunas estreitas (tabelas, `minipage`, duas colunas), palavras que o LaTeX não
sabe dividir, como nomes próprios, termos estrangeiros e neologismos, deixam as linhas muito
espaçadas ou passando da margem.

**Solução.** Indique os pontos de divisão: com `\-` dentro da palavra, para um caso isolado, ou com
`\hyphenation{...}` no preâmbulo, para todas as ocorrências.
Exemplo completo: [`hifenizacao.tex`](../../exemplos/basico/hifenizacao.tex).

## O problema

```latex
\begin{minipage}{3.5cm}
Estudos da Microssoftware apontam a instagramização da humanidade e a tiktokização das relações.
\end{minipage}
```

O `babel` aplica as regras de hifenização do português, mas elas não preveem todas as divisões de
palavras inventadas ou compostas com termos de outra língua. No exemplo, sem um ponto de divisão em
"Microssoftware" o LaTeX não encontra uma boa distribuição das linhas: elas ficam muito espaçadas e
o log registra avisos *Underfull \hbox (badness 10000)*.

## Solução pontual: `\-`

```latex
\begin{minipage}{3.5cm}
Estudos da Micros\-soft\-ware apontam a ins\-ta\-gra\-mi\-za\-ção da humanidade e a
tik\-to\-ki\-za\-ção das relações.
\end{minipage}
```

`\-` marca onde a palavra *pode* ser dividida; o hífen só aparece se a quebra ocorrer ali. Uma
palavra com `\-` só é dividida nos pontos marcados.

## Solução para o documento todo: `\hyphenation`

```latex
\hyphenation{Micros-soft-ware ins-ta-gra-mi-za-ção tik-to-ki-za-ção}

\begin{minipage}{3.5cm}
Estudos da Microssoftware apontam a instagramização da humanidade e a tiktokização das relações.
\end{minipage}
```

No exemplo, as duas soluções produzem o mesmo resultado, sem os avisos. Em um documento real, o
`\hyphenation` vai **no preâmbulo**, depois do `babel`; no exemplo ele está no meio do texto só para
que a primeira página mostre o problema.

## Ajustes comuns

- **Ver como o LaTeX divide uma palavra:** `\showhyphens{instagramização}` escreve no log os pontos
  de divisão que ele conhece.
- **Impedir a divisão de uma palavra:** liste-a sem hífens em `\hyphenation{GitHub}` ou coloque-a
  em uma caixa, `\mbox{GitHub}`.
- **Palavras com hífen** (`guarda-chuva`, `peer-to-peer`) só são quebradas no próprio hífen; se
  for preciso dividir as partes, marque os pontos com `\-`.
- **Texto em outra língua:** `\foreignlanguage{english}{...}` aplica as regras de hifenização
  daquela língua (carregue-a no `babel`: `\usepackage[english, brazilian]{babel}`, com a língua
  principal por último).

## Armadilhas

- **`\hyphenation` só aceita letras e hífens:** nada de comandos ou números dentro dele.
- **Não confunda os avisos:** *Overfull \hbox* indica texto passando da margem (mais grave);
  *Underfull \hbox*, linhas espaçadas demais. Os dois apontam a linha do arquivo no log.
