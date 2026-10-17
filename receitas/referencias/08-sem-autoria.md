# 08 – Obras sem autoria

Quando a obra não tem autoria, a entrada é o **título**, e a primeira palavra vai em maiúsculas
na lista de referências. Omita o campo `author`.

## Título como entrada

```bibtex
@book{ex-sem-autor,
  title     = {Pequena biblioteca do vinho},
  location  = {São Paulo},
  publisher = {Lafonte},
  year      = {2012},
}
```

> PEQUENA biblioteca do vinho. São Paulo: Lafonte, 2012.

Na citação: `\cite{ex-sem-autor}` → (Pequena [...], 2012).

## Título iniciado por artigo ou monossílabo

Escreva em maiúsculas o artigo e a palavra seguinte, e preencha `shorttitle`, que é o título curto
usado na citação:

```bibtex
@book{ex-sem-autor-artigo,
  title      = {OS GRANDES clássicos das poesias líricas},
  shorttitle = {Os grandes},
  location   = {[S. l.]},
  publisher  = {Ex Libris},
  year       = {1981},
  pagetotal  = {60},
}
```

> OS GRANDES clássicos das poesias líricas. [S. l.]: Ex Libris, 1981. 60 p.

Na citação: `\cite{ex-sem-autor-artigo}` → (Os grandes [...], 1981).

O formato "primeira palavra seguida de `[...]`" depende do ajuste da
[receita 02](02-ajustes-finos.md).
