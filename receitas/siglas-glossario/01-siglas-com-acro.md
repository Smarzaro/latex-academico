# 01 – Siglas com `acro`

**Problema.** Escrever o nome por extenso na primeira ocorrência de cada sigla ("Associação
Brasileira de Normas Técnicas (ABNT)"), só a sigla nas seguintes, e gerar a lista de siglas
automaticamente, em ordem alfabética e só com as siglas usadas.

**Solução.** O pacote `acro`. Declare as siglas no preâmbulo e use `\ac` no texto. Exemplo completo:
[`siglas-acro.tex`](../../exemplos/siglas/siglas-acro.tex).

```latex
\usepackage{acro}
```

## Declarar e usar

```latex
\DeclareAcronym{abnt}{short = ABNT, long = Associação Brasileira de Normas Técnicas}
\DeclareAcronym{ieee}{short = IEEE, long = \textit{Institute of Electrical and Electronics Engineers}}
% long-plural-form: forma plural completa, para quando o plural não é só "+s"
\DeclareAcronym{api}{short = API, long = Interface de Programação de Aplicações,
  long-plural-form = Interfaces de Programação de Aplicações}
```

| Comando | Resultado |
|---|---|
| `\ac{abnt}` | 1ª vez: Associação Brasileira de Normas Técnicas (ABNT); depois: ABNT |
| `\acp{api}` | Plural: APIs (na 1ª vez, Interfaces de Programação de Aplicações (APIs)) |
| `\acs{ieee}` / `\acl{ieee}` | Só a sigla / só o nome por extenso |

## Imprimir a lista

O `acro` já imprime uma lista com `\printacronyms`. Para a lista em duas colunas alinhadas
(sigla à esquerda, significado ao lado), com o título como os demais elementos pré-textuais
(centralizado, sem número, no sumário), use:

```latex
\NewAcroTemplate[heading]{abnt}{\pretextualchapter{\acrolistname}}
\acsetup{list/name = {Lista de siglas}, list/heading = abnt, list/template = tabular,
  templates/colspec = {@{}l@{\hspace{1.5em}}p{.8\linewidth}@{}}}
\newcommand{\listadesiglas}{{\renewcommand{\arraystretch}{1.5}%
  \printacronyms[exclude = abreviatura]}}
```

`\listadesiglas` vai no pré-textual, depois do sumário de ilustrações. A lista só inclui as siglas
**usadas** no texto; compile duas vezes (o `latexmk` faz isso).

## Cuidados

- **Não use `\ac` em resumos, títulos e legendas:** a expansão da primeira ocorrência deve ficar
  no texto corrido, onde a sigla aparece pela primeira vez.
- **Nomes em outro idioma** ficam em itálico (`long = \textit{...}`).
- **Dentro de `tabularx`, `longtable` e `\IBGEtab`** o conteúdo das células pode ser composto mais
  de uma vez, o que confunde a expansão: faça a primeira ocorrência no texto corrido e use a sigla
  pura (`\acs{...}`) nas células.
- **Plural.** O padrão acrescenta "s" à sigla e à forma longa; para plurais irregulares ("Interface"
  → "Interfaces"), use `long-plural-form`. Sem isso, sai "Aplicaçõess".
- **Erro "Undefined acronym".** Declare a sigla antes de usá-la, no preâmbulo.
