# 02 – Ajustes finos do `biblatex-abnt`

**Problema.** O estilo `abnt` cobre a maior parte da NBR 6023, mas alguns detalhes saem
diferentes do que o manual da UFV pede: o alinhamento à esquerda sem hifenização, os endereços
eletrônicos em fonte de máquina de escrever, o intervalo de páginas (traço longo em vez de hífen),
o intervalo de meses (hífen em vez de barra), a citação de obra sem autoria e o título da seção
de referências.

**Solução.** O arquivo [`ajustes-abnt.tex`](../../exemplos/referencias/ajustes-abnt.tex) reúne os
ajustes; inclua-o com `\input{ajustes-abnt}` **depois** de carregar o `biblatex`, com a classe
`abntex2` (usa `\pretextualchapter` e `\SingleSpacing`) e com o pacote `ragged2e` carregado.

```latex
% referências em espaço simples (a linha em branco entre elas já vem do biblatex-abnt)
\AtBeginBibliography{\SingleSpacing}
% alinhadas à esquerda (NBR 6023), mas com hifenização (o \raggedright do estilo a desliga)
% e com os endereços eletrônicos na mesma fonte do texto
\appto{\bibsetup}{\RaggedRight}
\urlstyle{same}
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

- **Alinhamento.** A NBR 6023 pede referências alinhadas à esquerda. A opção `justify` do
  `biblatex-abnt` justifica a lista, o que pode parecer mais bonito, mas não segue a norma. Sem
  ela, o estilo usa `\raggedright`, que desliga a hifenização e deixa a margem direita muito
  irregular; o `\RaggedRight` do `ragged2e` mantém a hifenização. Com o `xurl`, os endereços
  quebram em qualquer caractere. O exemplo
  [`alinhamento-referencias.tex`](../../exemplos/referencias/alinhamento-referencias.tex) compara as três formas.
- **Espaço entre referências.** A linha em branco vem do `biblatex-abnt` (`\bibitemsep` igual a uma
  linha). **Não** aumente o `\bibparsep`: em uma lista, o espaço entre itens é
  `\itemsep + \parsep`, e valores maiores que 0 deixam as referências mais afastadas que uma
  linha em branco.
- **Obra sem autoria.** Sem o ajuste, a citação não segue a regra "primeira palavra seguida de
  `[...]`"; com `shorttitle` preenchido, o título curto inteiro é usado.
- **Quem usa a classe `abntex2-ufv`** não precisa deste arquivo: a classe aplica os mesmos
  ajustes quando o `biblatex` é carregado.
