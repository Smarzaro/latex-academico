# 02 – Ajustes finos do `biblatex-abnt`

**Problema.** O estilo `abnt` cobre a maior parte da NBR 6023, mas quatro detalhes saem
diferentes do que o manual da UFV pede: o intervalo de páginas (traço longo em vez de hífen),
o intervalo de meses (hífen em vez de barra), a citação de obra sem autoria e o título da seção
de referências.

**Solução.** O arquivo [`ajustes-abnt.tex`](../../exemplos/referencias/ajustes-abnt.tex) reúne os
ajustes; inclua-o com `\input{ajustes-abnt}` **depois** de carregar o `biblatex`, com a classe
`abntex2` (usa `\pretextualchapter` e `\SingleSpacing`).

```latex
% referências em espaço simples (a linha em branco entre elas já vem do biblatex-abnt)
\AtBeginBibliography{\SingleSpacing}
% intervalos: páginas com hífen (p. 855-869) e meses com barra (nov./dez. 2003)
\DefineBibliographyExtras{brazilian}{\protected\def\bibrangedash{-}}
\renewcommand*{\bibdaterangesep}{/}
% citação de obra sem autoria: "Pequena [...]" (primeira palavra) ou, se o campo shorttitle
% estiver preenchido, "A flor [...]" (título curto completo)
\DeclareFieldFormat{firstword}{%
  \normalfont
  \iffieldundef{shorttitle}{\FirstWord{#1}}{#1}\space[...]\isdot}
% título "REFERÊNCIAS" centralizado, sem indicativo numérico, como nos demais elementos
\defbibheading{bibliography}[Refer\^encias]{%
  \pretextualchapter{\texorpdfstring{\MakeTextUppercase{#1}}{#1}}%
  \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeTextUppercase{#1}}{#1}}}
```

- **Espaço entre referências.** A linha em branco vem do `biblatex-abnt` (`\bibitemsep` igual a uma
  linha). **Não** aumente o `\bibparsep`: em uma lista, o espaço entre itens é
  `\itemsep + \parsep`, e valores maiores que 0 deixam as referências mais afastadas que uma
  linha em branco.
- **Obra sem autoria.** Sem o ajuste, a citação não segue a regra "primeira palavra seguida de
  `[...]`"; com `shorttitle` preenchido, o título curto inteiro é usado.
- **Quem usa a classe `abntex2-ufv`** não precisa deste arquivo: a classe aplica os mesmos
  ajustes quando o `biblatex` é carregado.
