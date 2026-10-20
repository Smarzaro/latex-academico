# 02 – Lista de abreviaturas

**Problema.** Abreviaturas ("p.", "ed.", "art.") e siglas são coisas diferentes, e a NBR 14724
recomenda listas separadas.

**Solução.** Use o mesmo `acro`, com uma etiqueta (`tag = abreviatura`) nas abreviaturas, e duas
listas: uma que **exclui** a etiqueta (siglas) e outra que **inclui** só ela (abreviaturas). Exemplo
completo: [`siglas-acro.tex`](../../exemplos/siglas/siglas-acro.tex).

```latex
\DeclareAcronym{art}{short = art., long = artigo, tag = abreviatura}
\DeclareAcronym{ed}{short = ed., long = edição, tag = abreviatura}

\newcommand{\listadeabreviaturas}{{\renewcommand{\arraystretch}{1.5}%
  \printacronyms[name = {Lista de abreviaturas}, include = abreviatura]}}
```

No texto, use `\acs{art}` (só a abreviatura) e não `\ac`: a abreviatura não é expandida.

```latex
\acs{art} 5 e \acs{ed} revista
```

> **Ponto final.** A abreviatura já traz o ponto ("art.", "ed."); evite repeti-lo no fim da
> frase, para não sair "ed..".

A `\listadesiglas` da [receita 01](01-siglas-com-acro.md) usa `exclude = abreviatura`, de modo que
as abreviaturas não aparecem na lista de siglas.
